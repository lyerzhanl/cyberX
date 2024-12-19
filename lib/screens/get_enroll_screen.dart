import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GetEnrollScreen extends StatefulWidget {
  const GetEnrollScreen({super.key});

  @override
  State<GetEnrollScreen> createState() => _GetEnrollScreenState();
}

class _GetEnrollScreenState extends State<GetEnrollScreen> {
  int _currentStep = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Stepper Header
          StepIndicator(currentStep: _currentStep),
          Expanded(
            child: StepperContent(
              currentStep: _currentStep,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    if (_currentStep < 2) {
                      _currentStep++;
                    } else {
                      const TransactionCompletedStep();
                    }
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF003096),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text(
                  'Continue',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Stepper Header
class StepperHeader extends StatelessWidget {
  final int currentStep;

  const StepperHeader({super.key, required this.currentStep});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 4,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(3, (index) {
          return Column(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundColor: currentStep == index
                    ? const Color(0xFF003096)
                    : const Color(0xFFD9D9D9),
                child: Text(
                  '${index + 1}',
                  style: TextStyle(
                    color: currentStep == index ? Colors.white : Colors.black,
                  ),
                ),
              ),
              if (index < 2)
                Container(
                  height: 2,
                  width: 40,
                  color: currentStep > index
                      ? const Color(0xFF003096)
                      : const Color(0xFFD9D9D9),
                ),
            ],
          );
        }),
      ),
    );
  }
}

class StepIndicator extends StatelessWidget {
  final int currentStep;

  const StepIndicator({super.key, required this.currentStep});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
          margin: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: const Color(0xFF003096).withOpacity(0.05),
            border: Border.all(color: const Color(0xFFD9D9D9), width: 1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: List.generate(5, (index) {
                  if (index % 2 == 0) {
                    // Circle with number
                    final stepIndex = index ~/ 2;
                    final isActive = stepIndex == currentStep;
                    return Container(
                      width: 41,
                      height: 41,
                      decoration: BoxDecoration(
                        color: isActive ? const Color(0xFF003096) : Colors.black,
                        shape: BoxShape.circle,
                        border: Border.all(color: const Color(0xFFD9D9D9), width: 1),
                      ),
                      child: Center(
                        child: Text(
                          '${stepIndex + 1}',
                          style: TextStyle(
                            color: isActive ? Colors.white : Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    );
                  } else {
                    // Line
                    final lineIndex = (index - 1) ~/ 2;
                    return Expanded(
                      child: Container(
                        height: 1,
                        color: (lineIndex < currentStep) ? const Color(0xFF003096) : Colors.black,
                      ),
                    );
                  }
                }),
              ),
              const SizedBox(height: 8),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Overview',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Payment Method',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Confirmation',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// Stepper Content
class StepperContent extends StatelessWidget {
  final int currentStep;

  const StepperContent({super.key, required this.currentStep});

  @override
  Widget build(BuildContext context) {
    switch (currentStep) {
      case 0:
        return const OverviewStep();
      case 1:
        return const PaymentMethodStep();
      case 2:
        return const TransactionCompletedStep();
      default:
        return const Center(child: Text('Unknown Step'));
    }
  }
}

// Overview Step
class OverviewStep extends StatelessWidget {
  const OverviewStep({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          const Text(
            'Overview',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          RichText(
            text: const TextSpan(
              children: [
                TextSpan(
                  text: 'Course Name : ',
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
                TextSpan(
                  text: 'Graphic Design',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 32),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFF003096).withOpacity(0.1),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: const Color(0xFFD9D9D9)),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CourseHighlight(
                        icon: Icons.video_library, label: '80+ Lectures'),
                    SizedBox(height: 10),
                    CourseHighlight(icon: Icons.timer, label: '8 Weeks'),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(left: 40.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CourseHighlight(
                          icon: Icons.check_circle_outline,
                          label: 'Certificate'),
                      SizedBox(height: 10),
                      CourseHighlight(
                          icon: Icons.local_offer, label: '10% Off'),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 32),
          Column(
            children: [
              Row(
                // mainAxisSize: MainAxisSize.min,
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      // Left Column for Labels
                      const Padding(
                        padding: EdgeInsets.only(left: 16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Course Rating :',
                              style: TextStyle(fontSize: 16),
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Course Time :',
                              style: TextStyle(fontSize: 16),
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Course Trainer :',
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(width: 50),

                      // Right Column for Values
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Stars Row
                          Row(
                            children: List.generate(
                              5,
                              (index) => const Icon(
                                Icons.star,
                                color: Color(0xFF003096),
                                size: 16,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            '8 Weeks',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            'Syed Hasnain',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 32),

              // Purchase Details Container
              Stack(
                clipBehavior: Clip.none,
                children: [
                  // Container for Purchase Details
                  Container(
                    padding: const EdgeInsets.fromLTRB(16, 24, 16, 16),
                    // Extra padding on top for space
                    margin: const EdgeInsets.symmetric(vertical: 16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border:
                          Border.all(color: const Color(0xFFE3E3E3), width: 1),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Date : 19/03/2024',
                                  style: TextStyle(fontSize: 14),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  'Coupon : 10% Off',
                                  style: TextStyle(fontSize: 14),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  'Price : 72\$',
                                  style: TextStyle(fontSize: 14),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  'Final Price : 65\$',
                                  style: TextStyle(fontSize: 14),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  // Floating Title
                  Positioned(
                    top: 5, // Adjust this value to move the text up or down
                    left: 20, // Position the text inside the container
                    child: Container(
                      color: Colors.white, // Matches the background color
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: const Text(
                        'Purchase Details',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}

// Payment Method Step
class PaymentMethodStep extends StatefulWidget {
  const PaymentMethodStep({super.key});

  @override
  State<PaymentMethodStep> createState() => _PaymentMethodStepState();
}

class _PaymentMethodStepState extends State<PaymentMethodStep> {
  String? selectedPaymentMethod; // Tracks the selected payment method

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title
          const Text(
            'Select Payment Method',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 32),

          // Payment Method Cards (only visible when no method is selected)
          if (selectedPaymentMethod ==
              null) // Change the condition to check for null or empty
            Column(
              children: [
                PaymentMethodCard(
                  label: 'EasyPaisa',
                  icon: Icons.add_circle,
                  isSelected: false, // Since no method is selected
                  onTap: () {
                    setState(() {
                      selectedPaymentMethod = 'EasyPaisa';
                    });
                  },
                ),
                PaymentMethodCard(
                  label: 'Add Credit Card',
                  icon: Icons.add_circle,
                  isSelected: false,
                  onTap: () {
                    setState(() {
                      selectedPaymentMethod = 'Add Credit Card';
                    });
                  },
                ),
                PaymentMethodCard(
                  label: 'JazzCash',
                  icon: Icons.add_circle,
                  isSelected: false,
                  onTap: () {
                    setState(() {
                      selectedPaymentMethod = 'JazzCash';
                    });
                  },
                ),
              ],
            ),

          // Render Fields Based on Selected Payment Method
          if (selectedPaymentMethod != null) const AddCardDetailsFields(),
        ],
      ),
    );
  }
}

// Payment Method Card
class PaymentMethodCard extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  const PaymentMethodCard({
    super.key,
    required this.label,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
          side: const BorderSide(color: Color(0xFFD9D9D9)),
        ),
        color: isSelected ? const Color(0xFFE5EAF4) : const Color(0xFFD2D2D2),
        margin: const EdgeInsets.symmetric(vertical: 8),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
          // Adjust padding
          child: ListTile(
            leading: Icon(
              icon,
              color: isSelected ? const Color(0xFF003096) : Colors.black,
              size: 32,
            ),
            title: Text(
              label,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}

// Add Card Details Fields
class AddCardDetailsFields extends StatelessWidget {
  const AddCardDetailsFields({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: const Color(0xFFE5EAF4),
            borderRadius: BorderRadius.circular(8),
          ),
          child: const TextField(
            decoration: InputDecoration(
              labelText: 'Name on Card',
              labelStyle: TextStyle(
                color: Color(0xFF938D8D),
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
              border: InputBorder.none,
            ),
          ),
        ),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: const Color(0xFFE5EAF4),
            borderRadius: BorderRadius.circular(8),
          ),
          child: const TextField(
            decoration: InputDecoration(
              labelText: 'Card Number',
              labelStyle: TextStyle(
                color: Color(0xFF938D8D),
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
              border: InputBorder.none,
            ),
          ),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: const Color(0xFFE5EAF4),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const TextField(
                  decoration: InputDecoration(
                    labelText: 'CVC Number',
                    labelStyle: TextStyle(
                      color: Color(0xFF938D8D),
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: const Color(0xFFE5EAF4),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const TextField(
                  decoration: InputDecoration(
                    labelText: 'Expiry Date',
                    labelStyle: TextStyle(
                      color: Color(0xFF938D8D),
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

// Add Card Details Step
class AddCardDetailsStep extends StatelessWidget {
  const AddCardDetailsStep({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          // Title
          const Text(
            'Select Payment Method',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 32),

          // Name on Card
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: const Color(0xFFE5EAF4),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const TextField(
              decoration: InputDecoration(
                labelText: 'Name on Card',
                labelStyle: TextStyle(
                    color: Color(0xFF938D8D),
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
                border: InputBorder.none,
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Card Number
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: const Color(0xFFE5EAF4),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const TextField(
              decoration: InputDecoration(
                labelText: 'Card Number',
                labelStyle: TextStyle(
                    color: Color(0xFF938D8D),
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
                border: InputBorder.none,
              ),
            ),
          ),
          const SizedBox(height: 16),

          // CVC and Expiry Date Row
          Row(
            children: [
              // CVC Number
              Expanded(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE5EAF4),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const TextField(
                    decoration: InputDecoration(
                      labelText: 'CVC Number',
                      labelStyle: TextStyle(
                          color: Color(0xFF938D8D),
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16),

              // Expiry Date
              Expanded(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE5EAF4),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const TextField(
                    decoration: InputDecoration(
                      labelText: 'Expiry Date',
                      labelStyle: TextStyle(
                          color: Color(0xFF938D8D),
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// Course Highlight Widget
class CourseHighlight extends StatelessWidget {
  final IconData icon;
  final String label;

  const CourseHighlight({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(icon, color: const Color(0xFF003096), size: 28),
        const SizedBox(width: 8),
        Text(label,
            style: const TextStyle(
                fontSize: 12,
                color: Colors.black,
                fontWeight: FontWeight.w600)),
      ],
    );
  }
}

class TransactionCompletedStep extends StatelessWidget {
  const TransactionCompletedStep({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      // Ensure it takes the full width and height
      child: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            // Ensure horizontal alignment
            children: [
              const Text(
                'Transaction Completed!',
                textAlign: TextAlign.center, // Center-align the text itself
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 32),

              // Illustration
              SvgPicture.asset(
                'assets/images/Transaction_Success.svg',
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
