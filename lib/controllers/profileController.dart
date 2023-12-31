import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:tiktok_clone/constants.dart';

class ProfileController extends GetxController {
  final Rx<Map<String, dynamic>> _user = Rx<Map<String, dynamic>>({});
  Map<String, dynamic> get user => _user.value;

  final Rx<String> _uid = ''.obs;

  updateUserId(String id) {
    _uid.value = id;
    getUserData();
  }

  getUserData() async {
    List<String> thumbnails = [];

    QuerySnapshot myVideos = await firestore
        .collection('videos')
        .where('uid', isEqualTo: _uid.value)
        .get();

    for (int i = 0; i < myVideos.docs.length; i++) {
      thumbnails.add((myVideos.docs[i].data() as dynamic)['thumbnail']);
    }

    DocumentSnapshot userDoc =
        await firestore.collection('users').doc(_uid.value).get();

    final userData = userDoc.data() as dynamic;
    String name = userData['name'];
    String profilePhoto = userData['profilePhoto'];
    int likes = 0;
    int followers = 0;
    int following = 0;
    bool isFollowing = false;

    for (var item in myVideos.docs) {
      likes += ((item.data()! as dynamic)['likes'] as List).length;
    }

    var followerDoc = await firestore
        .collection('users')
        .doc(_uid.value)
        .collection('followers')
        .get();

    var followingDoc = await firestore
        .collection('users')
        .doc(_uid.value)
        .collection('following')
        .get();

    followers = followerDoc.docs.length;
    following = followingDoc.docs.length;

    firestore
        .collection('users')
        .doc(_uid.value)
        .collection('followers')
        .doc(authController.user!.uid)
        .get()
        .then((value) {
      if (value.exists) {
        isFollowing = true;
      } else {
        isFollowing = false;
      }
    }).onError((error, stackTrace) {
      Get.snackbar('Error Occured', error.toString());
    });

    _user.value = {
      'followers': followers,
      'following': following,
      'isFollowing': isFollowing,
      'likes': likes,
      'profilePhoto': profilePhoto,
      'name': name,
      'thumbnails': thumbnails
    };
    update();
  }

  followUser() async {
    var doc = await firestore
        .collection('users')
        .doc(_uid.value)
        .collection('followers')
        .doc(authController.user!.uid)
        .get();
    if (!doc.exists) {
      await firestore
          .collection('users')
          .doc(_uid.value)
          .collection('followers')
          .doc(authController.user!.uid)
          .set({});
      await firestore
          .collection('users')
          .doc(authController.user!.uid)
          .collection('following')
          .doc(_uid.value)
          .set({});
      _user.value.update('followers', (value) => (value + 1));
    } else {
      await firestore
          .collection('users')
          .doc(_uid.value)
          .collection('followers')
          .doc(authController.user!.uid)
          .delete();
      await firestore
          .collection('users')
          .doc(authController.user!.uid)
          .collection('following')
          .doc(_uid.value)
          .delete();
      _user.value.update('followers', (value) => (value - 1));
    }
    _user.value.update('isFollowing', (value) => !value);
    update();
  }
}
