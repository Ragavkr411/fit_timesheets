import 'getReimbursementFields.dart';

class ScreenFieldAttr {
  Rimbtypedesc rimbtypedesc;
  Image image;
  Rimbtypedesc proofDocumentExist;
  Rimbtypedesc examount;
  Rimbtypeid rimbtypeid;
  Rimbtypedesc actions;
  Rimbtypedesc inlineActionDisabled;

  ScreenFieldAttr(
      {this.rimbtypedesc,
        this.image,
        this.proofDocumentExist,
        this.examount,
        this.rimbtypeid,
        this.actions,
        this.inlineActionDisabled});

  ScreenFieldAttr.fromJson(Map<String, dynamic> json) {
    rimbtypedesc = json['rimbtypedesc'] != null
        ? new Rimbtypedesc.fromJson(json['rimbtypedesc'])
        : null;
    image = json['image'] != null ? new Image.fromJson(json['image']) : null;
    proofDocumentExist = json['proofDocumentExist'] != null
        ? new Rimbtypedesc.fromJson(json['proofDocumentExist'])
        : null;
    examount = json['examount'] != null
        ? new Rimbtypedesc.fromJson(json['examount'])
        : null;
    rimbtypeid = json['rimbtypeid'] != null
        ? new Rimbtypeid.fromJson(json['rimbtypeid'])
        : null;
    actions = json['actions'] != null
        ? new Rimbtypedesc.fromJson(json['actions'])
        : null;
    inlineActionDisabled = json['inlineActionDisabled'] != null
        ? new Rimbtypedesc.fromJson(json['inlineActionDisabled'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.rimbtypedesc != null) {
      data['rimbtypedesc'] = this.rimbtypedesc.toJson();
    }
    if (this.image != null) {
      data['image'] = this.image.toJson();
    }
    if (this.proofDocumentExist != null) {
      data['proofDocumentExist'] = this.proofDocumentExist.toJson();
    }
    if (this.examount != null) {
      data['examount'] = this.examount.toJson();
    }
    if (this.rimbtypeid != null) {
      data['rimbtypeid'] = this.rimbtypeid.toJson();
    }
    if (this.actions != null) {
      data['actions'] = this.actions.toJson();
    }
    if (this.inlineActionDisabled != null) {
      data['inlineActionDisabled'] = this.inlineActionDisabled.toJson();
    }
    return data;
  }

  @override
  String toString() {
    return 'ScreenFieldAttr{rimbtypedesc: $rimbtypedesc, image: $image, proofDocumentExist: $proofDocumentExist, examount: $examount, rimbtypeid: $rimbtypeid, actions: $actions, inlineActionDisabled: $inlineActionDisabled}';
  }
}
