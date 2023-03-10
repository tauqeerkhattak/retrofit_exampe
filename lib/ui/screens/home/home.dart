import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retrofit_example/ui/screens/home/notifier/home_notifier.dart';
import 'package:retrofit_example/ui/screens/home/notifier/home_states.dart';

final homeProvider =
    StateNotifierProvider.autoDispose<HomeNotifier, HomeState>((ref) {
  return HomeNotifier();
});

class Home extends ConsumerStatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  ConsumerState<Home> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {

  @override
  void initState() {
    super.initState();
    ref.read(homeProvider.notifier).getData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer(
        builder: (context, ref, child) {
          final state = ref.watch(homeProvider);
          if (state is LoadingHomeState) {
            return child!;
          } else if (state is SuccessHomeState) {
            return _body(state);
          } else if (state is ErrorHomeState) {
            return Center(
              child: Text(state.message),
            );
          } else {
            return child!;
          }
        },
        child: const Center(
          child: CircularProgressIndicator.adaptive(),
        ),
      ),
    );
  }

  Widget _body(SuccessHomeState state) {
    return ListView.builder(
      itemCount: state.products.length,
      itemBuilder: (context, index) {
        final product = state.products[index];
        return Center(
          child: Text(product.title),
        );
      },
    );
  }
}
