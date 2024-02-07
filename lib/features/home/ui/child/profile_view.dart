import '../../../../exports.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  var userAbout = [
    'Self introduction',
    'Active Regions',
    'Height',
    'Modelling Exp',
    'Speciality Genres',
    'Awards',
    'Others',
    'Price Per Hour',
    'Why did you\n become model:',
    'Twitter',
    'Instagram',
  ];
  @override
  Widget build(BuildContext context) {
    return   Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 1,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  height: 200,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(6))),
                  child: ClipRRect(
                    borderRadius:
                    const BorderRadius.all(Radius.circular(6)),
                    child: Image.network(
                      'https://cdn.shopify.com/s/files/1/1494/5022/t/6/assets/amp-1605515911386-evolution_480x480@2x.JPG?v=1605515912',
                      fit: BoxFit.fill,
                    ),
                  )),
              CommonWidgets().commonSizedBox(20.0),

              ///------------------------------------------------ Badge and name and email  ----------------------------------
              CommonWidgets().badgeNameAndEmail(),
              CommonWidgets().commonSizedBox(20.0),

              ///------------------------------------------------ Shooting mode frequency and Approval time  ----------------------------------
              CommonWidgets().approvedTime(),
              CommonWidgets().commonSizedBox(20.0),

              ///------------------------------------------------ Shooting mode frequency and Approval time ---------------------------------

             Padding(
               padding: const EdgeInsets.all(8.0),
               child: Material(
                      elevation: 10,
                      child:  ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: userAbout.length,
                      itemBuilder: (context, i) {
                        return Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Column(
                            children: [
                              DualTextBar3(
                                text: userAbout[i],
                                text2: 'hellow world',
                              ),
                            ],
                          ),
                        );
                      }),
                ),
             ),
              CommonWidgets().commonSizedBox(20.0),
              DualTextBar3(
                text: 'Gallery',
                text2: '',
              ),
              CommonWidgets().commonSizedBox(20.0),
              GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 3 / 3,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10),
                  itemCount: 6,
                  itemBuilder: (BuildContext ctx, index) {
                    return InkWell(
                      onTap: () {},
                      child: Card(
                        color: KColor.whiteColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6)),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(6),
                          child: Image.network(
                              'https://cdn.shopify.com/s/files/1/1494/5022/t/6/assets/amp-1605515911386-evolution_480x480@2x.JPG?v=1605515912',
                              fit: BoxFit.fill),
                        ),
                      ),
                    );
                  }),
              CommonWidgets().commonSizedBox(20.0),
              DualTextBar3(
                text: 'Thank you message',
                text2: 'View all',
              ),
              CommonWidgets().commonSizedBox(20.0),

              ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 10,
                  itemBuilder: (context, i) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Material(
                        elevation: 6,
                        child: ListTile(
                          title: Text(
                            'Thank you so much for the shoot.she is very nice model',
                            style: TextStyle(
                              color: KColor.blackColor,
                              fontFamily: KFonts.poppinsRegular,
                              fontSize: 14,
                            ),
                          ),
                          trailing: Column(
                            children: [
                              CommonWidgets().commonSizedBox(20.0),
                              Text(
                                '${DateTime.now().year}/${DateTime.now().month}/${DateTime.now().day}',
                                style: TextStyle(
                                  color: KColor.greyColor,
                                  fontFamily: KFonts.poppinsRegular,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            ],
          );
        },
      ),
    );
  }
}
