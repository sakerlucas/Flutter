class Bachelor {
  String firstName;
  String lastName;
  Gender gender;
  String avatar;
  List<Gender>? searchFor;
  String? job;
  String? description;
  String id;

  Bachelor(this.firstName, this.lastName, this.id, this.gender, this.avatar,
      [this.searchFor, this.job, this.description]);

  @override
  String toString() {
    return '$firstName $lastName $id';
  }
}

enum Gender { male, female }
