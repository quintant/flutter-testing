import 'package:flutter/material.dart';


class DefaultItem extends StatefulWidget {
  @override
  _DefaultItemState createState() => _DefaultItemState();
}

class _DefaultItemState extends State<DefaultItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: MediaQuery.of(context).size.height * 0.3,
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          color: Color.fromARGB(255, 70, 68, 68),
        boxShadow: [BoxShadow(
          color: Colors.black.withAlpha(50),
          blurRadius: 7,
          spreadRadius: 5,
          offset: Offset.fromDirection(4, -8 )
        )]
      ),
      child: Container(
          // height: 250,
          padding: EdgeInsets.all(10),
          alignment: Alignment.center,
          child: Flex(
            direction: Axis.horizontal,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 3,
                child: ClipRRect(
                    child: Image(
                        image: NetworkImage('https://artsy-media-uploads.s3.amazonaws.com/GP4I3qF9kYD-ZWf0UcRPmA%2Fpepe-infowars-settle-mag.jpg'))),
              ),
              Spacer(),
              Expanded(

                flex: 6,
                child: Text(
                    'Haldnar tryggð bróðurbana varnaður, þjóðrekssonar skorast þráin, skotið eilífi meiðinn dólglegast framgöngumaður tiginborin ýmist. Dalalönd hlægja jálms ilbönd, föngum ómælilegt ekið mundurinn akratungu. Mörð lengr snjalla, öruggt kníf, þurrka gæs fjölmenn skók hvortveggja. Skegg þriflegra skýið eykina, höfðarnir herjólfssonar morðrunnr, kaupmála veturgamlan flýja sæta töluðu sénar skipast. Leiði kotkel, mótkennandi þeyti törgubuklara. Fjárágirnd leynd bræðrunga, skinnbókinni hofgyðja, vilk íþrótt merkistöngina umbótamenn vansverðað. Umbanda læt, finnferð gullsins klufðist óvirðulega. Úteyjar feðra gnýverðir gengið, féfangs brúðkaups muna, samdóma reginmóðs sæfðist hofgarða-refs föngum hugnist. Reyknum sakvar brosunaut geirþjófsfirði, klæðahlaðann ölseljunni eldfaldin, bakstursveinar kveðskap þingstöðin garðsbóndi skjótt mostrarsunds. Manni gátt kapla gói, ástsemd slokknaði flokki, mannafarar kunningjar guðmundarsonum þorviðar sveininum allhræddir færðar skipbrotsmönnum.',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18
                  ),
                  overflow: TextOverflow.clip,

                ),
              ),
            ],
          )),
    );
  }
}
