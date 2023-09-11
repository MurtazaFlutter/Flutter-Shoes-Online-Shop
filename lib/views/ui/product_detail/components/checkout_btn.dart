import '../../../../utils/exports.dart';

class CheckOutButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  const CheckOutButton({
    super.key,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.black, borderRadius: BorderRadius.circular(15)),
          height: 50,
          width: MediaQuery.of(context).size.width * 0.9,
          child: Center(
            child: Text(
              label,
              style: appStyle(20, Colors.white, FontWeight.bold, 1),
            ),
          ),
        ),
      ),
    );
  }
}
