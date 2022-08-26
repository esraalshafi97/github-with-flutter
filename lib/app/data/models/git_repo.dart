class GitRepo {
  int? id;
  String? nodeid;
  String? name;
  String? fullname;
  bool? private;
  Owner? owner;
  String? html_url;

  GitRepo({this.id, this.nodeid, this.name, this.fullname, this.private, this.owner,this.html_url});

  GitRepo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nodeid = json['node_id'];
    name = json['name'];
    fullname = json['full_name'];
    private = json['private'];
    owner = json['owner'] != null ? Owner?.fromJson(json['owner']) : null;
    html_url=json['html_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['node_id'] = nodeid;
    data['name'] = name;
    data['full_name'] = fullname;
    data['private'] = private;
    data['owner'] = owner!.toJson();
    data['html_url']=html_url.toString();
    return data;
  }
}

class Owner {
  String? avatarurl;

  Owner({this.avatarurl});

  Owner.fromJson(Map<String, dynamic> json) {
    avatarurl = json['avatar_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['avatar_url'] = avatarurl;
    return data;
  }
}