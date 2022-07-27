
class Message {
  var text;
  var date;
  var isSendByMe;

  Message(this.text, this.date,this.isSendByMe);

  Message.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    date = json['date'];
    isSendByMe = json['isSendByMe'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['text'] = this.text;
    data['date'] = this.date;
    date['isSendByMe'] =this.isSendByMe;
    return data;
  }

}