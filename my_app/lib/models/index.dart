import 'dart:convert' show json;

T asT<T>(dynamic value) {
  if (value is T) {
    return value;
  }

  return null;
}

class Root {
  Root({
    this.ID,
    this.Title,
    this.ShowSiteKey,
    this.LinkUrl,
    this.LinkType,
    this.ImgPath1,
    this.ImgPath2,
    this.ImgPath3,
    this.CreateTime,
    this.Status,
    this.Sort,
    this.Remark,
    this.ShowTime,
    this.DayShowCount,
    this.ObjType,
    this.ObjID,
    this.ObjCode,
    this.LinkUrl_App,
    this.LinkUrl_WXXCX,
    this.Attr1,
  });

  factory Root.fromJson(Map<String, dynamic> jsonRes) => jsonRes == null
      ? null
      : Root(
          ID: asT<int>(jsonRes['ID']),
          Title: asT<String>(jsonRes['Title']),
          ShowSiteKey: asT<String>(jsonRes['ShowSiteKey']),
          LinkUrl: asT<String>(jsonRes['LinkUrl']),
          LinkType: asT<int>(jsonRes['LinkType']),
          ImgPath1: asT<String>(jsonRes['ImgPath1']),
          ImgPath2: asT<String>(jsonRes['ImgPath2']),
          ImgPath3: asT<String>(jsonRes['ImgPath3']),
          CreateTime: asT<String>(jsonRes['CreateTime']),
          Status: asT<int>(jsonRes['Status']),
          Sort: asT<int>(jsonRes['Sort']),
          Remark: asT<String>(jsonRes['Remark']),
          ShowTime: asT<int>(jsonRes['ShowTime']),
          DayShowCount: asT<String>(jsonRes['DayShowCount']),
          ObjType: asT<int>(jsonRes['ObjType']),
          ObjID: asT<int>(jsonRes['ObjID']),
          ObjCode: asT<String>(jsonRes['ObjCode']),
          LinkUrl_App: asT<String>(jsonRes['LinkUrl_App']),
          LinkUrl_WXXCX: asT<String>(jsonRes['LinkUrl_WXXCX']),
          Attr1: asT<String>(jsonRes['Attr1']),
        );

  int ID;
  String Title;
  String ShowSiteKey;
  String LinkUrl;
  int LinkType;
  String ImgPath1;
  String ImgPath2;
  String ImgPath3;
  String CreateTime;
  int Status;
  int Sort;
  String Remark;
  int ShowTime;
  String DayShowCount;
  int ObjType;
  int ObjID;
  String ObjCode;
  String LinkUrl_App;
  String LinkUrl_WXXCX;
  String Attr1;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'ID': ID,
        'Title': Title,
        'ShowSiteKey': ShowSiteKey,
        'LinkUrl': LinkUrl,
        'LinkType': LinkType,
        'ImgPath1': ImgPath1,
        'ImgPath2': ImgPath2,
        'ImgPath3': ImgPath3,
        'CreateTime': CreateTime,
        'Status': Status,
        'Sort': Sort,
        'Remark': Remark,
        'ShowTime': ShowTime,
        'DayShowCount': DayShowCount,
        'ObjType': ObjType,
        'ObjID': ObjID,
        'ObjCode': ObjCode,
        'LinkUrl_App': LinkUrl_App,
        'LinkUrl_WXXCX': LinkUrl_WXXCX,
        'Attr1': Attr1,
      };
  @override
  String toString() {
    return json.encode(this);
  }
}
