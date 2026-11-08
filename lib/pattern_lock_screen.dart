import 'package:flutter/material.dart';

class PatternLockScreen extends StatefulWidget {
  const PatternLockScreen({super.key});

  @override
  State<PatternLockScreen> createState() => _PatternLockScreenState();
}

class _PatternLockScreenState extends State<PatternLockScreen> {
  String _enteredPattern = '';
  final String _correctPattern = '1235789'; // उदाहरण के लिए डिफ़ॉल्ट पैटर्न

  void _onNodeSelected(String node) {
    setState(() {
      if (!_enteredPattern.contains(node)) {
        _enteredPattern += node;
      }
    });
  }

  void _verifyPattern() {
    if (_enteredPattern == _correctPattern) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Access Granted: Pranjal Media Pro')),
      );
      // यहाँ से मेन डैशबोर्ड पर रिडायरेक्ट कर सकते हैं
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Incorrect Pattern! Try Again.')),
      );
      setState(() {
        _enteredPattern = '';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Security Lock - Pranjal Media Pro'),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.admin_panel_settings_rounded,
            size: 60,
            color: Color(0xFFD4AF37), // Gold Accent
          ),
          const SizedBox(height: 20),
          const Text(
            'Draw Unlock Pattern',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'Pattern: $_enteredPattern',
            style: const TextStyle(color: Colors.grey, fontSize: 14),
          ),
          const SizedBox(height: 40),
          // 3x3 Grid Simulation
          Center(
            child: Container(
              width: 280,
              height: 280,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFF1A1A1A),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: const Color(0xFFD4AF37), width: 1.5),
              ),
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                ),
                itemCount: 9,
                itemBuilder: (context, index) {
                  String nodeNumber = (index + 1).toString();
                  bool isSelected = _enteredPattern.contains(nodeNumber);
                  return GestureDetector(
                    onTap: () => _onNodeSelected(nodeNumber),
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: isSelected ? const Color(0xFFD4AF37) : Colors.black,
                        border: Border.all(
                          color: const Color(0xFFD4AF37),
                          width: 2,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          nodeNumber,
                          style: TextStyle(
                            color: isSelected ? Colors.black : Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[800],
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  setState(() {
                    _enteredPattern = '';
                  });
                },
                child: const Text('Reset'),
              ),
              const SizedBox(width: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFD4AF37),
                  foregroundColor: Colors.black,
                ),
                onPressed: _verifyPattern,
                child: const Text('Verify'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
