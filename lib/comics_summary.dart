import 'package:flutter/foundation.dart';
class ComicsSummary {
    ComicsSummary({
        @required this.id,
        @required this.digitalId,
        @required this.title,
        @required this.issueNumber,
        @required this.variantDescription,
        @required this.description,
        @required this.modified,
        @required this.isbn,
        @required this.upc,
        @required this.diamondCode,
        @required this.ean,
        @required this.issn,
        @required this.format,
        @required this.pageCount,
        @required this.textObjects,
        @required this.resourceUri,
        @required this.urls,
        @required this.series,
        @required this.variants,
        @required this.collections,
        @required this.collectedIssues,
        @required this.dates,
        @required this.prices,
        @required this.thumbnail,
        @required this.images,
        @required this.creators,
        @required this.characters,
        @required this.stories,
        @required this.events,
    });

    final int id;
    final int digitalId;
    final String title;
    final int issueNumber;
    final String variantDescription;
    final String description;
    final String modified;
    final String isbn;
    final String upc;
    final DiamondCode diamondCode;
    final String ean;
    final String issn;
    final Format format;
    final int pageCount;
    final List<TextObject> textObjects;
    final String resourceUri;
    final List<Url> urls;
    final Series series;
    final List<Series> variants;
    final List<dynamic> collections;
    final List<Series> collectedIssues;
    final List<Date> dates;
    final List<Price> prices;
    final Thumbnail thumbnail;
    final List<Thumbnail> images;
    final Creators creators;
    final Characters characters;
    final Stories stories;
    final Characters events;

    factory ComicsSummary.fromJson(Map<String, dynamic> json) => ComicsSummary(
        id: json["id"],
        digitalId: json["digitalId"],
        title: json["title"],
        issueNumber: json["issueNumber"],
        variantDescription: json["variantDescription"],
        description: json["description"] == null ? null : json["description"],
        modified: json["modified"],
        isbn: json["isbn"],
        upc: json["upc"],
        diamondCode: diamondCodeValues.map[json["diamondCode"]],
        ean: json["ean"],
        issn: json["issn"],
        format: formatValues.map[json["format"]],
        pageCount: json["pageCount"],
        textObjects: List<TextObject>.from(json["textObjects"].map((x) => TextObject.fromJson(x))),
        resourceUri: json["resourceURI"],
        urls: List<Url>.from(json["urls"].map((x) => Url.fromJson(x))),
        series: Series.fromJson(json["series"]),
        variants: List<Series>.from(json["variants"].map((x) => Series.fromJson(x))),
        collections: List<dynamic>.from(json["collections"].map((x) => x)),
        collectedIssues: List<Series>.from(json["collectedIssues"].map((x) => Series.fromJson(x))),
        dates: List<Date>.from(json["dates"].map((x) => Date.fromJson(x))),
        prices: List<Price>.from(json["prices"].map((x) => Price.fromJson(x))),
        thumbnail: Thumbnail.fromJson(json["thumbnail"]),
        images: List<Thumbnail>.from(json["images"].map((x) => Thumbnail.fromJson(x))),
        creators: Creators.fromJson(json["creators"]),
        characters: Characters.fromJson(json["characters"]),
        stories: Stories.fromJson(json["stories"]),
        events: Characters.fromJson(json["events"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "digitalId": digitalId,
        "title": title,
        "issueNumber": issueNumber,
        "variantDescription": variantDescription,
        "description": description == null ? null : description,
        "modified": modified,
        "isbn": isbn,
        "upc": upc,
        "diamondCode": diamondCodeValues.reverse[diamondCode],
        "ean": ean,
        "issn": issn,
        "format": formatValues.reverse[format],
        "pageCount": pageCount,
        "textObjects": List<dynamic>.from(textObjects.map((x) => x.toJson())),
        "resourceURI": resourceUri,
        "urls": List<dynamic>.from(urls.map((x) => x.toJson())),
        "series": series.toJson(),
        "variants": List<dynamic>.from(variants.map((x) => x.toJson())),
        "collections": List<dynamic>.from(collections.map((x) => x)),
        "collectedIssues": List<dynamic>.from(collectedIssues.map((x) => x.toJson())),
        "dates": List<dynamic>.from(dates.map((x) => x.toJson())),
        "prices": List<dynamic>.from(prices.map((x) => x.toJson())),
        "thumbnail": thumbnail.toJson(),
        "images": List<dynamic>.from(images.map((x) => x.toJson())),
        "creators": creators.toJson(),
        "characters": characters.toJson(),
        "stories": stories.toJson(),
        "events": events.toJson(),
    };
}

class Characters {
    Characters({
        @required this.available,
        @required this.collectionUri,
        @required this.items,
        @required this.returned,
    });

    final int available;
    final String collectionUri;
    final List<Series> items;
    final int returned;

    factory Characters.fromJson(Map<String, dynamic> json) => Characters(
        available: json["available"],
        collectionUri: json["collectionURI"],
        items: List<Series>.from(json["items"].map((x) => Series.fromJson(x))),
        returned: json["returned"],
    );

    Map<String, dynamic> toJson() => {
        "available": available,
        "collectionURI": collectionUri,
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
        "returned": returned,
    };
}

class Series {
    Series({
        @required this.resourceUri,
        @required this.name,
    });

    final String resourceUri;
    final String name;

    factory Series.fromJson(Map<String, dynamic> json) => Series(
        resourceUri: json["resourceURI"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "resourceURI": resourceUri,
        "name": name,
    };
}

class Creators {
    Creators({
        @required this.available,
        @required this.collectionUri,
        @required this.items,
        @required this.returned,
    });

    final int available;
    final String collectionUri;
    final List<CreatorsItem> items;
    final int returned;

    factory Creators.fromJson(Map<String, dynamic> json) => Creators(
        available: json["available"],
        collectionUri: json["collectionURI"],
        items: List<CreatorsItem>.from(json["items"].map((x) => CreatorsItem.fromJson(x))),
        returned: json["returned"],
    );

    Map<String, dynamic> toJson() => {
        "available": available,
        "collectionURI": collectionUri,
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
        "returned": returned,
    };
}

class CreatorsItem {
    CreatorsItem({
        @required this.resourceUri,
        @required this.name,
        @required this.role,
    });

    final String resourceUri;
    final String name;
    final Role role;

    factory CreatorsItem.fromJson(Map<String, dynamic> json) => CreatorsItem(
        resourceUri: json["resourceURI"],
        name: json["name"],
        role: roleValues.map[json["role"]],
    );

    Map<String, dynamic> toJson() => {
        "resourceURI": resourceUri,
        "name": name,
        "role": roleValues.reverse[role],
    };
}

enum Role { EDITOR, PENCILLER_COVER, COLORIST, INKER, WRITER, PENCILLER, LETTERER, PENCILER }

final roleValues = EnumValues({
    "colorist": Role.COLORIST,
    "editor": Role.EDITOR,
    "inker": Role.INKER,
    "letterer": Role.LETTERER,
    "penciler": Role.PENCILER,
    "penciller": Role.PENCILLER,
    "penciller (cover)": Role.PENCILLER_COVER,
    "writer": Role.WRITER
});

class Date {
    Date({
        @required this.type,
        @required this.date,
    });

    final DateType type;
    final String date;

    factory Date.fromJson(Map<String, dynamic> json) => Date(
        type: dateTypeValues.map[json["type"]],
        date: json["date"],
    );

    Map<String, dynamic> toJson() => {
        "type": dateTypeValues.reverse[type],
        "date": date,
    };
}

enum DateType { ONSALE_DATE, FOC_DATE }

final dateTypeValues = EnumValues({
    "focDate": DateType.FOC_DATE,
    "onsaleDate": DateType.ONSALE_DATE
});

enum DiamondCode { EMPTY, JUL190068 }

final diamondCodeValues = EnumValues({
    "": DiamondCode.EMPTY,
    "JUL190068": DiamondCode.JUL190068
});

enum Format { EMPTY, DIGEST, COMIC, TRADE_PAPERBACK }

final formatValues = EnumValues({
    "Comic": Format.COMIC,
    "Digest": Format.DIGEST,
    "": Format.EMPTY,
    "Trade Paperback": Format.TRADE_PAPERBACK
});

class Thumbnail {
    Thumbnail({
        @required this.path,
        @required this.extension,
    });

    final String path;
    final Extension extension;

    factory Thumbnail.fromJson(Map<String, dynamic> json) => Thumbnail(
        path: json["path"],
        extension: extensionValues.map[json["extension"]],
    );

    Map<String, dynamic> toJson() => {
        "path": path,
        "extension": extensionValues.reverse[extension],
    };
}

enum Extension { JPG }

final extensionValues = EnumValues({
    "jpg": Extension.JPG
});

class Price {
    Price({
        @required this.type,
        @required this.price,
    });

    final PriceType type;
    final double price;

    factory Price.fromJson(Map<String, dynamic> json) => Price(
        type: priceTypeValues.map[json["type"]],
        price: json["price"].toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "type": priceTypeValues.reverse[type],
        "price": price,
    };
}

enum PriceType { PRINT_PRICE }

final priceTypeValues = EnumValues({
    "printPrice": PriceType.PRINT_PRICE
});

class Stories {
    Stories({
        @required this.available,
        @required this.collectionUri,
        @required this.items,
        @required this.returned,
    });

    final int available;
    final String collectionUri;
    final List<StoriesItem> items;
    final int returned;

    factory Stories.fromJson(Map<String, dynamic> json) => Stories(
        available: json["available"],
        collectionUri: json["collectionURI"],
        items: List<StoriesItem>.from(json["items"].map((x) => StoriesItem.fromJson(x))),
        returned: json["returned"],
    );

    Map<String, dynamic> toJson() => {
        "available": available,
        "collectionURI": collectionUri,
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
        "returned": returned,
    };
}

class StoriesItem {
    StoriesItem({
        @required this.resourceUri,
        @required this.name,
        @required this.type,
    });

    final String resourceUri;
    final String name;
    final ItemType type;

    factory StoriesItem.fromJson(Map<String, dynamic> json) => StoriesItem(
        resourceUri: json["resourceURI"],
        name: json["name"],
        type: itemTypeValues.map[json["type"]],
    );

    Map<String, dynamic> toJson() => {
        "resourceURI": resourceUri,
        "name": name,
        "type": itemTypeValues.reverse[type],
    };
}

enum ItemType { COVER, INTERIOR_STORY, PROMO }

final itemTypeValues = EnumValues({
    "cover": ItemType.COVER,
    "interiorStory": ItemType.INTERIOR_STORY,
    "promo": ItemType.PROMO
});

class TextObject {
    TextObject({
        @required this.type,
        @required this.language,
        @required this.text,
    });

    final TextObjectType type;
    final Language language;
    final String text;

    factory TextObject.fromJson(Map<String, dynamic> json) => TextObject(
        type: textObjectTypeValues.map[json["type"]],
        language: languageValues.map[json["language"]],
        text: json["text"],
    );

    Map<String, dynamic> toJson() => {
        "type": textObjectTypeValues.reverse[type],
        "language": languageValues.reverse[language],
        "text": text,
    };
}

enum Language { EN_US }

final languageValues = EnumValues({
    "en-us": Language.EN_US
});

enum TextObjectType { ISSUE_SOLICIT_TEXT }

final textObjectTypeValues = EnumValues({
    "issue_solicit_text": TextObjectType.ISSUE_SOLICIT_TEXT
});

class Url {
    Url({
        @required this.type,
        @required this.url,
    });

    final UrlType type;
    final String url;

    factory Url.fromJson(Map<String, dynamic> json) => Url(
        type: urlTypeValues.map[json["type"]],
        url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "type": urlTypeValues.reverse[type],
        "url": url,
    };
}

enum UrlType { DETAIL, PURCHASE }

final urlTypeValues = EnumValues({
    "detail": UrlType.DETAIL,
    "purchase": UrlType.PURCHASE
});

class EnumValues<T> {
    Map<String, T> map;
    Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap;
    }
}

class ItemCarrinho {
  ComicsSummary comicsSummary;
  int qtd;
  String valor;
  ItemCarrinho(this.comicsSummary, {this.qtd, this.valor});
}

class PedidoFechado {
  List<ItemCarrinho> itens;
  double total;
  DateTime data;
  PedidoFechado({this.itens, this.total, this.data});
}