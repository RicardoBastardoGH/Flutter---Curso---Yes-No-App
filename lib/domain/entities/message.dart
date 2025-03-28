enum FromWhom { me, her }

class Message {

  final String text;
  final String? imageUrl;
  final FromWhom fromWhom;

  Message({required this.text, this.imageUrl, required this.fromWhom});

  get data => null;
}
