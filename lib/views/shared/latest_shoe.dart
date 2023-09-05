import '../../utils/exports.dart';

class LatestShoes extends StatelessWidget {
  const LatestShoes({
    super.key,
    required Future<List<Sneakers>> male,
  }) : _male = male;

  final Future<List<Sneakers>> _male;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Sneakers>>(
        future: _male,
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('error ${snapshot.hasError}');
          } else {
            final male = snapshot.data;
            return StaggeredGridView.countBuilder(
                padding: EdgeInsets.zero,
                itemCount: male!.length,
                mainAxisSpacing: 16,
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                itemBuilder: (context, index) {
                  final male = snapshot.data![index];
                  return ChangeNotifierProvider.value(
                    value: male,
                    child: const StaggeredTileWidget(),
                  );
                },
                staggeredTileBuilder: ((index) => StaggeredTile.extent(
                    index % 2 == 0 ? 1 : 1,
                    (index % 4 == 1 || index % 4 == 3)
                        ? MediaQuery.of(context).size.height * 0.35
                        : MediaQuery.of(context).size.height * 0.3)));
          }
        }));
  }
}
