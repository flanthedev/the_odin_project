var name1 = prompt("What is the main character's name?");
var adj1 = prompt("choose an adjective");
var loc1 = prompt("choose a location");
var adj2 = prompt("choose another adjective");
var name2 = prompt("choose a friends name");
var loc2 = prompt("choose another location");
var food = prompt("choose a food");

var adv1 = prompt("choose an adverb");



var story = document.getElementById('story')
story.innerHTML += name1 + " was a " + adj1 + " person who lived in "
  + loc1 + ". " + name1 + " was also a " + adj2 +
  " person and really only had one friend in the world, " + name2 + ". "
  + name1 + " and " + name2 + " met in " + loc2 + " when " + name1 + " was " + adv1
  + " ordering " + food + " from the trunk of a car."
