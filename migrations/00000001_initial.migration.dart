import 'dart:async';
import 'package:aqueduct/aqueduct.dart';

class Migration1 extends Migration {
  @override
  Future upgrade() async {
    database.createTable(SchemaTable("_AgeGender", [
      SchemaColumn("id", ManagedPropertyType.integer,
          isPrimaryKey: true,
          autoincrement: true,
          isIndexed: false,
          isNullable: false,
          isUnique: false),
      SchemaColumn("ageGroup", ManagedPropertyType.string,
          isPrimaryKey: false,
          autoincrement: false,
          isIndexed: false,
          isNullable: false,
          isUnique: false),
      SchemaColumn("male", ManagedPropertyType.integer,
          isPrimaryKey: false,
          autoincrement: false,
          isIndexed: false,
          isNullable: false,
          isUnique: false),
      SchemaColumn("female", ManagedPropertyType.integer,
          isPrimaryKey: false,
          autoincrement: false,
          isIndexed: false,
          isNullable: false,
          isUnique: false),
      SchemaColumn("totalAgeGroup", ManagedPropertyType.integer,
          isPrimaryKey: false,
          autoincrement: false,
          isIndexed: false,
          isNullable: false,
          isUnique: false),
      SchemaColumn("updatedDate", ManagedPropertyType.datetime,
          isPrimaryKey: false,
          autoincrement: false,
          isIndexed: false,
          isNullable: false,
          isUnique: false)
    ]));
    database.createTable(SchemaTable("_DistrictCases", [
      SchemaColumn("districtName", ManagedPropertyType.string,
          isPrimaryKey: true,
          autoincrement: false,
          isIndexed: true,
          isNullable: false,
          isUnique: false),
      SchemaColumn("region", ManagedPropertyType.string,
          isPrimaryKey: false,
          autoincrement: false,
          isIndexed: true,
          isNullable: false,
          isUnique: false),
      SchemaColumn("cases", ManagedPropertyType.integer,
          isPrimaryKey: false,
          autoincrement: false,
          isIndexed: false,
          isNullable: false,
          isUnique: false),
      SchemaColumn("deaths", ManagedPropertyType.integer,
          isPrimaryKey: false,
          autoincrement: false,
          isIndexed: false,
          isNullable: false,
          isUnique: false),
      SchemaColumn("recoveries", ManagedPropertyType.integer,
          isPrimaryKey: false,
          autoincrement: false,
          isIndexed: false,
          isNullable: false,
          isUnique: false),
      SchemaColumn("lastUpdated", ManagedPropertyType.datetime,
          isPrimaryKey: false,
          autoincrement: false,
          isIndexed: false,
          isNullable: false,
          isUnique: false)
    ]));
    database.createTable(SchemaTable("_HospitalCases", [
      SchemaColumn("hospitalName", ManagedPropertyType.string,
          isPrimaryKey: true,
          autoincrement: false,
          isIndexed: true,
          isNullable: false,
          isUnique: false),
      SchemaColumn("admission", ManagedPropertyType.integer,
          isPrimaryKey: false,
          autoincrement: false,
          isIndexed: false,
          isNullable: false,
          isUnique: false),
      SchemaColumn("discharge", ManagedPropertyType.integer,
          isPrimaryKey: false,
          autoincrement: false,
          isIndexed: false,
          isNullable: false,
          isUnique: false),
      SchemaColumn("deaths", ManagedPropertyType.integer,
          isPrimaryKey: false,
          autoincrement: false,
          isIndexed: false,
          isNullable: false,
          isUnique: false),
      SchemaColumn("recoveries", ManagedPropertyType.integer,
          isPrimaryKey: false,
          autoincrement: false,
          isIndexed: false,
          isNullable: false,
          isUnique: false),
      SchemaColumn("lastUpdated", ManagedPropertyType.datetime,
          isPrimaryKey: false,
          autoincrement: false,
          isIndexed: false,
          isNullable: false,
          isUnique: false),
      SchemaColumn("createdDate", ManagedPropertyType.datetime,
          isPrimaryKey: false,
          autoincrement: false,
          isIndexed: false,
          isNullable: false,
          isUnique: false)
    ]));
    database.createTable(SchemaTable("_Timeline", [
      SchemaColumn("id", ManagedPropertyType.integer,
          isPrimaryKey: true,
          autoincrement: true,
          isIndexed: false,
          isNullable: false,
          isUnique: false),
      SchemaColumn("createdAt", ManagedPropertyType.datetime,
          isPrimaryKey: false,
          autoincrement: false,
          isIndexed: false,
          isNullable: false,
          isUnique: false),
      SchemaColumn("cases", ManagedPropertyType.integer,
          isPrimaryKey: false,
          autoincrement: false,
          isIndexed: false,
          isNullable: false,
          isUnique: false),
      SchemaColumn("deaths", ManagedPropertyType.integer,
          isPrimaryKey: false,
          autoincrement: false,
          isIndexed: false,
          isNullable: false,
          isUnique: false),
      SchemaColumn("recoveries", ManagedPropertyType.integer,
          isPrimaryKey: false,
          autoincrement: false,
          isIndexed: false,
          isNullable: false,
          isUnique: false)
    ]));
    database.createTable(SchemaTable("_Summary", [
      SchemaColumn("id", ManagedPropertyType.integer,
          isPrimaryKey: true,
          autoincrement: true,
          isIndexed: false,
          isNullable: false,
          isUnique: false),
      SchemaColumn("cases", ManagedPropertyType.integer,
          isPrimaryKey: false,
          autoincrement: false,
          isIndexed: false,
          isNullable: false,
          isUnique: false),
      SchemaColumn("deaths", ManagedPropertyType.integer,
          isPrimaryKey: false,
          autoincrement: false,
          isIndexed: false,
          isNullable: false,
          isUnique: false),
      SchemaColumn("recoveries", ManagedPropertyType.integer,
          isPrimaryKey: false,
          autoincrement: false,
          isIndexed: false,
          isNullable: false,
          isUnique: false),
      SchemaColumn("lastUpdated", ManagedPropertyType.datetime,
          isPrimaryKey: false,
          autoincrement: false,
          isIndexed: false,
          isNullable: false,
          isUnique: false)
    ]));
  }

  @override
  Future downgrade() async {}

  @override
  Future seed() async {
    final seedSummary = [
      {
        'cases': 1166,
        'deaths': 2,
        'recoveries': 980,
        'lastUpdated': DateTime.now().toLocal(),
      }
    ];
    for (final seedItem in seedSummary) {
      await database.store.execute(
          "INSERT INTO _Summary (cases, deaths, recoveries, lastUpdated) VALUES (@cases, @deaths, @recoveries, @lastUpdated)",
          substitutionValues: {
            "cases": seedItem['cases'],
            "deaths": seedItem['deaths'],
            "recoveries": seedItem['recoveries'],
            "lastUpdated": seedItem['lastUpdated'],
          });
    }

    final seedTimeline = [
      {
        'cases': 1,
        'deaths': 0,
        'recoveries': 1,
        'createdAt': DateTime.now().toLocal()
      },
      {
        'cases': 350,
        'deaths': 0,
        'recoveries': 402,
        'createdAt': DateTime.now().toLocal()
      },
      {
        'cases': 1166,
        'deaths': 2,
        'recoveries': 980,
        'createdAt': DateTime.now().toLocal()
      },
    ];
    for (final timelineItem in seedTimeline) {
      await database.store.execute(
          "INSERT INTO _Timeline (cases, deaths, recoveries, createdAt) VALUES (@cases, @deaths, @recoveries, @createdAt)",
          substitutionValues: {
            "cases": timelineItem['cases'],
            "deaths": timelineItem['deaths'],
            "recoveries": timelineItem['recoveries'],
            "createdAt": timelineItem['createdAt'],
          });
    }

    final seedHospitalCases = [
      {
        'hospitalName': "Entebbe Grade B",
        'admission': 1,
        'discharge': 20,
        'deaths': 0,
        'recoveries': 1,
        'lastUpdated': DateTime.now().toLocal(),
        'createdDate': DateTime.now().toLocal(),
      },
      {
        'hospitalName': "Masaka Referral",
        'admission': 350,
        'discharge': 20,
        'deaths': 0,
        'recoveries': 402,
        'lastUpdated': DateTime.now().toLocal(),
        'createdDate': DateTime.now().toLocal(),
      },
      {
        'hospitalName': "Namisindwa Hospital",
        'admission': 1166,
        'discharge': 20,
        'deaths': 2,
        'recoveries': 980,
        'lastUpdated': DateTime.now().toLocal(),
        'createdDate': DateTime.now().toLocal(),
      },
    ];
    for (final hospitalCase in seedHospitalCases) {
      await database.store.execute(
          "INSERT INTO _HospitalCases (hospitalName,admission,discharge, deaths, recoveries,lastUpdated, createdDate) VALUES (@hospitalName,@admission, @discharge, @deaths, @recoveries,@lastUpdated,@createdDate)",
          substitutionValues: {
            "hospitalName": hospitalCase['hospitalName'],
            "admission": hospitalCase['admission'],
            "discharge": hospitalCase['discharge'],
            "deaths": hospitalCase['deaths'],
            "recoveries": hospitalCase['recoveries'],
            'lastUpdated': hospitalCase['lastUpdated'],
            'createdDate': hospitalCase['createdDate'],
          });
    }

    final seedDistrictCases = [
      {
        'districtName': "Kampala",
        'region': "Central",
        'cases': 75,
        'deaths': 0,
        'recoveries': 68,
        'lastUpdated': DateTime.now().toLocal(),
      },
      {
        'districtName': "Gulu",
        'region': "North",
        'cases': 10,
        'deaths': 0,
        'recoveries': 15,
        'lastUpdated': DateTime.now().toLocal(),
      },
      {
        'districtName': "Mbale",
        'region': "East",
        'cases': 23,
        'deaths': 0,
        'recoveries': 20,
        'lastUpdated': DateTime.now().toLocal(),
      },
    ];
    for (final districtCase in seedDistrictCases) {
      await database.store.execute(
          "INSERT INTO _DistrictCases (districtName, region,cases, deaths, recoveries,lastUpdated) VALUES (@districtName, @region, @cases, @deaths, @recoveries,@lastUpdated)",
          substitutionValues: {
            "districtName": districtCase['districtName'],
            "region": districtCase['region'],
            "cases": districtCase['cases'],
            "deaths": districtCase['deaths'],
            "recoveries": districtCase['recoveries'],
            "lastUpdated": districtCase['lastUpdated']
          });
    }

    final seedAgeGender = [
      {
        'ageGroup': '0-9',
        'male': 5,
        'female': 6,
        'totalAgeGroup': 11,
        'updatedDate': DateTime.now().toLocal()
      },
      {
        'ageGroup': '10-19',
        'male': 0,
        'female': 6,
        'totalAgeGroup': 6,
        'updatedDate': DateTime.now().toLocal()
      },
      {
        'ageGroup': '20-39',
        'male': 25,
        'female': 6,
        'totalAgeGroup': 31,
        'updatedDate': DateTime.now().toLocal()
      },
      {
        'ageGroup': '40-59',
        'male': 20,
        'female': 16,
        'totalAgeGroup': 36,
        'updatedDate': DateTime.now().toLocal()
      },
      {
        'ageGroup': '60-79',
        'male': 0,
        'female': 2,
        'totalAgeGroup': 2,
        'updatedDate': DateTime.now().toLocal()
      },
    ];

    for (final ageGenderItem in seedAgeGender) {
      await database.store.execute(
          "INSERT INTO _AgeGender(ageGroup,male,female,totalAgeGroup,updatedDate) VALUES (@ageGroup, @male, @female, @totalAgeGroup,@updatedDate)",
          substitutionValues: {
            "ageGroup": ageGenderItem['ageGroup'],
            "male": ageGenderItem['male'],
            "female": ageGenderItem['female'],
            "totalAgeGroup": ageGenderItem['totalAgeGroup'],
            "updatedDate": ageGenderItem['updatedDate'],
          });
    }
  }
}
