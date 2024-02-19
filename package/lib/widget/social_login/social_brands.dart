enum Brand {
  custom(name:'custom'),
  google(name: 'Google'),
  twitter(name: 'Twitter'),
  facebook(name: 'Facebook');


  final String name;
  const Brand({required this.name});
}


// apple(name: 'Apple'),
// github(name: 'Github'),
// custom(name: 'Custom'),
// spotify(name: 'Spotify'),
// discord(name: 'Discord'),
// linkedin(name: 'Linkedin'),
// microsoft(name: 'Microsoft'),
// pinterest(name: 'Pinterest');