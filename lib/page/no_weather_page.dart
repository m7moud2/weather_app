import 'package:flutter/material.dart';
import 'package:weather_app/page/searsh_page.dart';

class NoWeatherPage extends StatelessWidget {
  const NoWeatherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const Spacer(),
          const Image(
            image: AssetImage('assets/images/gif/woman_day.gif'),
            width: 400,
            height: 400,
          ),
          const Text(
            'Start searching now 🔍 !',
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600),
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return const SearchPage();
                  },
                ));
              },
              child: const Text(
                'Start Weather',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
              )),
          const Spacer(),
        ],
      ),
    );
  }
}
