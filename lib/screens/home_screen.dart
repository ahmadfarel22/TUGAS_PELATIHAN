import 'package:kas_personal/providers/kas_provider.dart';
import 'package:kas_personal/widgets/card_kas_info_all.dart';
import 'package:kas_personal/widgets/creator_info.dart';
import 'package:kas_personal/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void onKasMasukTap() => context.goNamed('kas_masuk');
  void onKasKeluarTap() => context.goNamed('kas_keluar');
   void ontransaksiTap() => context.goNamed('transaksi');

  void onInfoTap() async {
    await showDialog(
      context: context,
      builder: (context) {
        return const Dialog(
          child: CreatorInfo(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kas Personal App'),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Consumer<KasProvider>(
              builder: (context, value, child) {
                final items = value.items;
                return CardKasInfoAll(items: items);
              },
            ),
            const SizedBox(
              height: 10,
            ),
            Divider(
              color: const Color.fromARGB(255, 200, 199, 199),
              height: 0,
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Flexible(
                  fit: FlexFit.tight,
                  child: CustomIconButton(
                    backgroundColor: Color.fromARGB(255, 18, 215, 44),
                    icon: Icons.credit_card,
                    text: 'Kas Masuk',
                    onTap: onKasMasukTap,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Flexible(
                  fit: FlexFit.tight,
                  child: CustomIconButton(
                    backgroundColor: Color.fromARGB(255, 245, 58, 20),
                    icon: Icons.receipt,
                    text: 'Kas Keluar',
                    onTap: onKasKeluarTap,
                  ),
                ),
              ],
            ),
              const SizedBox(
              height: 10,
            ),
            CustomIconButton(
              backgroundColor: Colors.amber,
              icon: Icons.info,
              text: 'lihat semua transaksi',
              onTap: ontransaksiTap,
            ),
            const SizedBox(
              height: 10,
            ),
            CustomIconButton(
              backgroundColor: Colors.amber,
              icon: Icons.info,
              text: 'Tentang Pembuat',
              onTap: onInfoTap,
            ),
          ],
        ),
      ),
    );
  }
}