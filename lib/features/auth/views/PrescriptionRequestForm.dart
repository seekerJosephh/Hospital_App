import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class PrescriptionRequestForm extends StatefulWidget {
  const PrescriptionRequestForm({super.key});

  @override
  State<PrescriptionRequestForm> createState() =>
      _PrescriptionRequestFormState();
}

class _PrescriptionRequestFormState extends State<PrescriptionRequestForm> {
  final _formKey = GlobalKey<FormState>();

  // Controllers
  final _medicineController = TextEditingController();
  final _dosageController = TextEditingController();
  final _frequencyController = TextEditingController();
  final _notesController = TextEditingController();

  String? _selectedUrgency = 'Normal';
  File? _prescriptionImage;
  bool _isLoading = false;

  final List<String> _urgencyOptions = ['Normal', 'Urgent', 'Very Urgent'];

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _prescriptionImage = File(pickedFile.path);
      });
    }
  }

  Future<void> _submitRequest() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    // Simulate API call / processing delay
    await Future.delayed(const Duration(seconds: 2));

    setState(() => _isLoading = false);

    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Prescription request submitted successfully!'),
        backgroundColor: Colors.green,
      ),
    );

    Navigator.pop(context); // Go back to prescription list
  }

  @override
  void dispose() {
    _medicineController.dispose();
    _dosageController.dispose();
    _frequencyController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded, color: Colors.black87),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'New Prescription Request',
          style: TextStyle(
            color: Colors.black87,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Medicine name
                _buildTextField(
                  controller: _medicineController,
                  label: 'Medicine Name',
                  hint: 'e.g. Amlodipine 5mg',
                  validator: (value) =>
                      value?.trim().isEmpty ?? true ? 'Required' : null,
                  icon: Icons.medical_services_outlined,
                ),
                const SizedBox(height: 20),

                // Dosage
                _buildTextField(
                  controller: _dosageController,
                  label: 'Dosage',
                  hint: 'e.g. 1 tablet',
                  validator: (value) =>
                      value?.trim().isEmpty ?? true ? 'Required' : null,
                  icon: Icons.format_list_numbered,
                ),
                const SizedBox(height: 20),

                // Frequency
                _buildTextField(
                  controller: _frequencyController,
                  label: 'Frequency',
                  hint: 'e.g. Once daily after breakfast',
                  validator: (value) =>
                      value?.trim().isEmpty ?? true ? 'Required' : null,
                  icon: Icons.repeat,
                ),
                const SizedBox(height: 20),

                // Urgency
                const Text(
                  'Urgency Level',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 8),
                DropdownButtonFormField<String>(
                  value: _selectedUrgency,
                  items: _urgencyOptions.map((urgency) {
                    return DropdownMenuItem(
                      value: urgency,
                      child: Text(urgency),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() => _selectedUrgency = value);
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.grey.shade300),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
                const SizedBox(height: 24),

                // Attach old prescription photo (optional)
                const Text(
                  'Attach previous prescription (optional)',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 12),
                GestureDetector(
                  onTap: _pickImage,
                  child: Container(
                    height: 140,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300, width: 2),
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.grey.shade50,
                    ),
                    child: _prescriptionImage == null
                        ? const Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.add_photo_alternate_outlined,
                                  size: 48,
                                  color: Color(0xFF26A69A),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  'Tap to upload photo',
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ],
                            ),
                          )
                        : ClipRRect(
                            borderRadius: BorderRadius.circular(14),
                            child: Image.file(
                              _prescriptionImage!,
                              fit: BoxFit.cover,
                              width: double.infinity,
                              height: double.infinity,
                            ),
                          ),
                  ),
                ),
                const SizedBox(height: 24),

                // Notes / Reason
                _buildTextField(
                  controller: _notesController,
                  label: 'Additional Notes / Reason',
                  hint: 'e.g. Running out soon, need refill',
                  maxLines: 4,
                  icon: Icons.note_alt_outlined,
                ),
                const SizedBox(height: 40),

                // Submit button
                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton.icon(
                    onPressed: _isLoading ? null : _submitRequest,
                    icon: _isLoading
                        ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              color: Colors.white,
                              strokeWidth: 2.5,
                            ),
                          )
                        : const Icon(
                            Icons.send,
                            color: Colors.white,
                          ),
                    label: Text(
                      _isLoading ? 'Submitting...' : 'Submit Request',
                      style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF26A69A),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      elevation: 0,
                    ),
                  ),
                ),

                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    String? Function(String?)? validator,
    IconData? icon,
    int maxLines = 1,
  }) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      validator: validator,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        prefixIcon:
            icon != null ? Icon(icon, color: const Color(0xFF26A69A)) : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        filled: true,
        fillColor: Colors.white,
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.red, width: 2),
        ),
      ),
    );
  }
}
