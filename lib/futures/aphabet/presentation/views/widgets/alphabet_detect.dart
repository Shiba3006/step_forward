import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:step_forward/core/utils/assets_data.dart';
import 'package:step_forward/futures/aphabet/presentation/view_model/alphabet_learn_cubit/alphabet_learn_cubit.dart';

class AlphabetDetect extends StatelessWidget {
  const AlphabetDetect({
    super.key,
    required this.alphabet,
  });
  final List<String> alphabet;

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<AlphabetLearnCubit>(context);
    return BlocBuilder<AlphabetLearnCubit, AlphabetLearnState>(
      builder: (context, state) {
        return SizedBox(
            height: 200,
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  AssetsData.kLogo,
                  height: 100,
                ),
                const SizedBox(width: 40),
                Text(
                  alphabet[cubit.count],
                  style: const TextStyle(
                    fontSize: 100,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ));
      },
    );
  }
}
