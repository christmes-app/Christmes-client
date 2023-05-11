class JSONRoom {
  List<Chunk>? chunk;
  String? end;
  String? start;

  JSONRoom({this.chunk, this.end, this.start});

  JSONRoom.fromJson(Map<String, dynamic> json) {
    if (json['chunk'] != null) {
      chunk = <Chunk>[];
      json['chunk'].forEach((v) {
        chunk!.add(new Chunk.fromJson(v));
      });
    }
    end = json['end'];
    start = json['start'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.chunk != null) {
      data['chunk'] = this.chunk!.map((v) => v.toJson()).toList();
    }
    data['end'] = this.end;
    data['start'] = this.start;
    return data;
  }
}

class Chunk {
  String? type;
  Content? content;
  String? sender;
  String? eventId;
  int? originServerTs;
  Unsigned? unsigned;
  String? roomId;
  String? stateKey;

  Chunk(
      {this.type,
        this.content,
        this.sender,
        this.eventId,
        this.originServerTs,
        this.unsigned,
        this.roomId,
        this.stateKey});

  Chunk.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    content =
    json['content'] != null ? new Content.fromJson(json['content']) : null;
    sender = json['sender'];
    eventId = json['event_id'];
    originServerTs = json['origin_server_ts'];
    unsigned = json['unsigned'] != null
        ? new Unsigned.fromJson(json['unsigned'])
        : null;
    roomId = json['room_id'];
    stateKey = json['state_key'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    if (this.content != null) {
      data['content'] = this.content!.toJson();
    }
    data['sender'] = this.sender;
    data['event_id'] = this.eventId;
    data['origin_server_ts'] = this.originServerTs;
    if (this.unsigned != null) {
      data['unsigned'] = this.unsigned!.toJson();
    }
    data['room_id'] = this.roomId;
    data['state_key'] = this.stateKey;
    return data;
  }
}

class Content {
  String? body;
  String? msgtype;
  String? name;
  String? guestAccess;
  String? historyVisibility;
  String? joinRule;
  String? displayname;
  String? membership;
  String? creator;
  String? roomVersion;

  Content(
      {this.body,
        this.msgtype,
        this.name,
        this.guestAccess,
        this.historyVisibility,
        this.joinRule,
        this.displayname,
        this.membership,
        this.creator,
        this.roomVersion});

  Content.fromJson(Map<String, dynamic> json) {
    body = json['body'];
    msgtype = json['msgtype'];
    name = json['name'];
    guestAccess = json['guest_access'];
    historyVisibility = json['history_visibility'];
    joinRule = json['join_rule'];
    displayname = json['displayname'];
    membership = json['membership'];
    creator = json['creator'];
    roomVersion = json['room_version'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['body'] = this.body;
    data['msgtype'] = this.msgtype;
    data['name'] = this.name;
    data['guest_access'] = this.guestAccess;
    data['history_visibility'] = this.historyVisibility;
    data['join_rule'] = this.joinRule;
    data['displayname'] = this.displayname;
    data['membership'] = this.membership;
    data['creator'] = this.creator;
    data['room_version'] = this.roomVersion;
    return data;
  }
}

class Unsigned {
  int? age;

  Unsigned({this.age});

  Unsigned.fromJson(Map<String, dynamic> json) {
    age = json['age'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['age'] = this.age;
    return data;
  }
}
