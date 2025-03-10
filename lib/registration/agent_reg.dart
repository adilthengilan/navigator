import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class AgentRegistrationPage extends StatefulWidget {
  const AgentRegistrationPage({Key? key}) : super(key: key);

  @override
  State<AgentRegistrationPage> createState() => _AgentRegistrationPageState();
}

class _AgentRegistrationPageState extends State<AgentRegistrationPage> {
  int _currentStep = 1;
  bool _isOfficeOwned = true;
  String? _selectedAgencyType;
  String? _selectedCity;
  String? _selectedState;
  File? _logoImage;
  final ImagePicker _picker = ImagePicker();
  bool _obscurePassword = true;
  
  // Text controllers
  final TextEditingController _agencyNameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _tollFreeController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _websiteController = TextEditingController();
  final TextEditingController _companyNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  
  // Lists for dropdown options
  final List<String> _agencyTypes = ['Agent', 'Broker', 'Consultant', 'Independent', 'Corporation'];
  final List<String> _indianStates = [
    'Andhra Pradesh', 'Arunachal Pradesh', 'Assam', 'Bihar', 'Chhattisgarh', 
    'Goa', 'Gujarat', 'Haryana', 'Himachal Pradesh', 'Jharkhand', 
    'Karnataka', 'Kerala', 'Madhya Pradesh', 'Maharashtra', 'Manipur', 
    'Meghalaya', 'Mizoram', 'Nagaland', 'Odisha', 'Punjab', 
    'Rajasthan', 'Sikkim', 'Tamil Nadu', 'Telangana', 'Tripura', 
    'Uttar Pradesh', 'Uttarakhand', 'West Bengal'
  ];
  
  // Sample list of cities for demo
  final Map<String, List<String>> _citiesByState = {
    'Maharashtra': ['Mumbai', 'Pune', 'Nagpur', 'Thane', 'Nashik', 'Aurangabad'],
    'Karnataka': ['Bangalore', 'Mysore', 'Hubli', 'Mangalore', 'Belgaum'],
    'Tamil Nadu': ['Chennai', 'Coimbatore', 'Madurai', 'Tiruchirappalli', 'Salem'],
    'Gujarat': ['Ahmedabad', 'Surat', 'Vadodara', 'Rajkot', 'Gandhinagar'],
    'Delhi': ['New Delhi', 'North Delhi', 'South Delhi', 'East Delhi', 'West Delhi'],
    'Kerala': ['Malappuram', 'Calicut', 'Kochi', 'Thrissur', 'Trivandrum'],
  };
  
  List<String> _getCitiesForState(String? state) {
    if (state == null || !_citiesByState.containsKey(state)) {
      return ['Select a state first'];
    }
    return _citiesByState[state]!;
  }

  @override
  void dispose() {
    _agencyNameController.dispose();
    _addressController.dispose();
    _phoneController.dispose();
    _tollFreeController.dispose();
    _emailController.dispose();
    _websiteController.dispose();
    _companyNameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
  
  // Method to pick image from gallery
  Future<void> _pickImage() async {
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _logoImage = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isDesktop = screenWidth > 1200;
    
    return Scaffold(
      body: Container(
        width: screenWidth,
        height: screenHeight,
        child: Center(
          child: SingleChildScrollView(
            child: Card(
              margin: EdgeInsets.all(isDesktop ? 40 : 20),
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Container(
                width: isDesktop ? 1000 : 900,
                padding: const EdgeInsets.all(30),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Agent Registration',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 30),
                    _buildStepper(),
                    const SizedBox(height: 30),
                    const Text(
                      'Profile Information',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    _buildFormFields(isDesktop),
                    const SizedBox(height: 20),
                    Text(
                      'In order to process your registration, we ask you to provide the following information. Please note that all fields marked with an asterisk (*) are required.',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                    ),
                    const SizedBox(height: 30),
                    _buildActionButtons(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildStepper() {
    return Row(
      children: [
        _buildStepperItem(1, 'Personal Details', true),
        _buildStepperDivider(true),
        _buildStepperItem(2, 'Agency Details', true),
        _buildStepperDivider(false),
        _buildStepperItem(3, 'Contact Person Details', false),
        _buildStepperDivider(false),
        _buildStepperItem(4, 'Work Order Scope', false),
      ],
    );
  }

  Widget _buildStepperItem(int step, String title, bool isActive) {
    bool isCompleted = step < _currentStep;
    
    return Expanded(
      child: Row(
        children: [
          Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isCompleted || isActive ? Colors.green : Colors.white,
              border: Border.all(
                color: isCompleted || isActive ? Colors.green : Colors.grey,
              ),
            ),
            child: Center(
              child: isCompleted 
                ? const Icon(Icons.check, color: Colors.white, size: 16)
                : Text(
                    step.toString(),
                    style: TextStyle(
                      color: isActive ? Colors.white : Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                color: isActive ? Colors.black : Colors.grey,
                fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStepperDivider(bool isActive) {
    return Container(
      width: 30,
      height: 1,
      color: isActive ? Colors.green : Colors.grey[300],
    );
  }

  Widget _buildFormFields(bool isDesktop) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: _buildTextField('Agency Name*', controller: _agencyNameController),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: _buildDropdownField('Agency Type*', _selectedAgencyType ?? 'Select Agency Type', _agencyTypes),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: _buildPasswordField('Password*', controller: _passwordController),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            Expanded(
              child: _buildTextField('Address*', controller: _addressController),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: _buildDropdownField('City*', _selectedCity ?? 'Select City', 
                      _selectedState != null ? _getCitiesForState(_selectedState) : ['Select a state first']),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: _buildDropdownField('State*', _selectedState ?? 'Select State', _indianStates),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: _buildTextField('Telephone Number*', controller: _phoneController),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            Expanded(
              child: _buildTextField('Toll-Free Number*', controller: _tollFreeController),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: _buildTextField('Email ID*', controller: _emailController),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: _buildTextField('Website*', controller: _websiteController),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            Expanded(
              child: _buildTextFieldWithIcon('Company Name*', Icons.business, controller: _companyNameController),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: _buildRadioButtons(),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: _buildFileUpload('Company Logo*'),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildTextField(String label, {TextEditingController? controller}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.normal,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: BorderSide(color: Colors.grey[300]!),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: BorderSide(color: Colors.grey[300]!),
            ),
          ),
          style: const TextStyle(fontSize: 14),
        ),
      ],
    );
  }

  Widget _buildPasswordField(String label, {TextEditingController? controller}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.normal,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          obscureText: _obscurePassword,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: BorderSide(color: Colors.grey[300]!),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: BorderSide(color: Colors.grey[300]!),
            ),
            suffixIcon: IconButton(
              icon: Icon(
                _obscurePassword ? Icons.visibility_off : Icons.visibility,
                color: Colors.grey,
                size: 18,
              ),
              onPressed: () {
                setState(() {
                  _obscurePassword = !_obscurePassword;
                });
              },
            ),
          ),
          style: const TextStyle(fontSize: 14),
        ),
      ],
    );
  }

  Widget _buildTextFieldWithIcon(String label, IconData icon, {TextEditingController? controller}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.normal,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: BorderSide(color: Colors.grey[300]!),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: BorderSide(color: Colors.grey[300]!),
            ),
            suffixIcon: Icon(icon, color: Colors.grey, size: 18),
          ),
          style: const TextStyle(fontSize: 14),
        ),
      ],
    );
  }

  Widget _buildDropdownField(String label, String value, List<String> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.normal,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          height: 48,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey[300]!),
            borderRadius: BorderRadius.circular(4),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              isExpanded: true,
              icon: const Icon(Icons.arrow_drop_down),
              value: label == 'Agency Type*' ? _selectedAgencyType : 
                     label == 'State*' ? _selectedState : 
                     label == 'City*' ? _selectedCity : null,
              hint: Text(
                value,
                style: TextStyle(
                  color: value.contains('Select') ? Colors.grey : Colors.black,
                  fontSize: 14,
                ),
              ),
              items: items.map<DropdownMenuItem<String>>((String item) {
                return DropdownMenuItem<String>(
                  value: item,
                  child: Text(
                    item,
                    style: const TextStyle(fontSize: 14),
                  ),
                );
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  if (label == 'Agency Type*') {
                    _selectedAgencyType = newValue;
                  } else if (label == 'State*') {
                    _selectedState = newValue;
                    _selectedCity = null; // Reset city when state changes
                  } else if (label == 'City*') {
                    _selectedCity = newValue;
                  }
                });
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildRadioButtons() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Office Space',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.normal,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          height: 48,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(4),
          ),
          child: Row(
            children: [
              Radio(
                value: true,
                groupValue: _isOfficeOwned,
                activeColor: Colors.green,
                onChanged: (bool? value) {
                  setState(() {
                    if (value != null) _isOfficeOwned = value;
                  });
                },
              ),
              const Text('Owned'),
              const SizedBox(width: 20),
              Radio(
                value: false,
                groupValue: _isOfficeOwned,
                activeColor: Colors.green,
                onChanged: (bool? value) {
                  setState(() {
                    if (value != null) _isOfficeOwned = value;
                  });
                },
              ),
              const Text('Rental'),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildFileUpload(String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.normal,
          ),
        ),
        const SizedBox(height: 8),
        InkWell(
          onTap: _pickImage,
          child: Container(
            height: 48,
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(4),
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  height: 48,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(4),
                      bottomLeft: Radius.circular(4),
                    ),
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    'Choose File',
                    style: TextStyle(fontSize: 14),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    _logoImage != null ? 
                      _logoImage!.path.split('/').last : 
                      'No file chosen.',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                      overflow: TextOverflow.ellipsis,
                    ),
                    maxLines: 1,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildActionButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.grey[400],
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          ),
          child: const Text(
            'CANCEL',
            style: TextStyle(color: Colors.white),
          ),
        ),
        const SizedBox(width: 10),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
          ),
          child: Row(
            children: const [
              Text(
                'CONTINUE',
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(width: 8),
              Icon(Icons.arrow_forward, size: 18),
            ],
          ),
        ),
      ],
    );
  }
}