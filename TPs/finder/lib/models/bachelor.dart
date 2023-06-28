class Bachelor {
  String firstName;
  String lastName;
  Gender gender;
  String avatar;
  List<Gender>? searchFor;
  String? job;
  String? description;

  Bachelor(this.firstName, this.lastName, this.gender, this.avatar,
      [this.searchFor, this.job, this.description]);
}

enum Gender { male, female }
