import 'dart:developer';

import 'package:ayol_uchun_project/data/model/category_model.dart';
import 'package:ayol_uchun_project/data/model/social_accounts_model.dart';
import 'package:ayol_uchun_project/features/home_page/manager/home_bloc.dart';
import 'package:ayol_uchun_project/features/home_page/manager/home_event.dart';
import 'package:ayol_uchun_project/features/home_page/manager/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../data/model/interview_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<HomeBloc>().add(LoadHomeData());
  }
  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeBloc, HomeState>(
      listener: (context, state) {
        if (state is HomeError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        }
      },
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.grey[100],
            body: state is HomeLoading
                ? const Center(child: CircularProgressIndicator())
                : state is HomeLoaded?
              SingleChildScrollView(
          child: Column(
          children: [
          _buildAppBar(),
          const SizedBox(height: 8),
          _buildTopCourseCard(),
          const SizedBox(height: 8),
          _buildCategoriesSection(categories: state.categories),
          const SizedBox(height: 8),
          _buildSocialSection(socialAccounts: state.socialAccounts),
          const SizedBox(height: 8),
          _buildInterviewsSection(interviews: state.interviews),
          const SizedBox(height: 8),
          _buildBottomPromoCard(),
          const SizedBox(height: 20),
          ],
          ),
          ): SizedBox.shrink(),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: 0,
              selectedItemColor: Colors.pink,
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: "Asosiy"),
                BottomNavigationBarItem(icon: Icon(Icons.book), label: "Kurslar"),
                BottomNavigationBarItem(icon: Icon(Icons.person), label: "Kabinet"),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildAppBar() {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.pink,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(24),
          bottomRight: Radius.circular(24),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(0, 3),
          ),
        ],
      ),
      padding: const EdgeInsets.only(top: 40, left: 16, right: 16, bottom: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Text(
            "Salom, Mohinur 🦰",
            style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Icon(Icons.notifications_none, color: Colors.white),
        ],
      ),
    );
  }

  Widget _buildTopCourseCard() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Image.asset("assets/images/for_women.png", height: 60),
          const SizedBox(height: 10),
          const Text(
            "Sizda hali boshlangan kurs mavjud emas. Ko‘plab foydali kurslarimiz orasidan bittasini tanlang.",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14),
          ),
          const SizedBox(height: 12),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.pink,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            ),
            child:  Text("Kursni boshlash"),
          )
        ],
      ),
    );
  }

  Widget _buildCategoriesSection({required List<CategoryModel> categories}) {


    return Container(
      margin:  EdgeInsets.symmetric(horizontal: 16),
      padding:  EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xffFBF2F4),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Text(
            "KATEGORIYALAR",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: categories.map((c) {
              return Container(
                width: 160,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Color(0xffFDD3DB)),
                  borderRadius: BorderRadius.circular(8)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 6),
                        Text(
                          c.title,
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 11),
                        ),
                        Text(
                          "${c.totalCourses} ta dars",
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 11, color: Colors.grey),
                        )
                      ],
                    ),
                    SvgPicture.network(c.icon)
                  ],
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 12),
          ElevatedButton(

            style: ElevatedButton.styleFrom(
              fixedSize: Size(335, 50),
              backgroundColor: Color(0xffFDD3DB),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))
            ),
              onPressed: () {

              },
              child: Text("Barcha kategoriyalar ➔"))
        ],
      ),
    );
  }

  Widget _buildSocialSection({required List<SocialAccountModel> socialAccounts}) {

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Ijtimoiy tarmoqlarimiz:", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
          const SizedBox(height: 8),
          ListView.builder(itemBuilder: (context, index) {
            return GestureDetector(
                onTap: ()async {
                  final url = socialAccounts[index].link;
                  if (await canLaunchUrl(Uri.parse(url))) {
                  await launchUrl(Uri.parse(url));
                  } else {
                  log('Could not launch $url');
                  }
                },
                child: SvgPicture.network(socialAccounts[index].icon));
          },)
        ],
      ),
    );
  }

  Widget _buildInterviewsSection({required List<InterviewModel> interviews}) {
 

   return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text("INTERVYU", style: TextStyle(fontWeight: FontWeight.bold)),
        ),
         SizedBox(height: 15),
        SizedBox(
          height: 140,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding:  EdgeInsets.symmetric(horizontal: 16),
            itemCount: interviews.length,
            itemBuilder: (context, index) {
              return Container(
                margin:  EdgeInsets.only(right: 12),
                width: 160,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius:  BorderRadius.vertical(top: Radius.circular(12)),
                        child: Image.network(interviews[index].image??"", fit: BoxFit.cover, width: double.infinity),
                      ),
                    ),
                    Padding(
                      padding:  EdgeInsets.all(8.0),
                      child: Text(
                        interviews[index].title,
                        style:  TextStyle(fontSize: 12),
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        )
      ],
    );
  }

  Widget _buildBottomPromoCard() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.pink[100],
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(

              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Hey, Siz har aylar uchun foydali tavsiyalarni olishingiz mumkin!",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.pink,
                  ),
                  child: const Text("Qabul qilish"),
                )
              ],
            ),
          ),
           SizedBox(width: 10),
          Image.asset("assets/images/fon.png", height: 160),
        ],
      ),
    );
  }
}
