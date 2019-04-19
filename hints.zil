;"HINTS for WISHBRINGER"
;"modify ROUTINE FINISH in VERBS to include Hint"
;"Check HELP or HINT syntaxes to match V-HINT (and CLOCKER-VERBS)"
;"Make sure the Flag in the V-HINTS-OFF syntax is correct"
;"Add HINT and HINTS-OFF to CLOCKER-VERB list --done arb"
;"(CLOCKER-VERB is here known as GAME-VERB)"
<FILE-FLAGS CLEAN-STACK?>

<GLOBAL HINTS-OFF -1>

<SYNTAX HINT = V-HINT>
<SYNTAX HINT OFF OBJECT (FIND RLANDBIT) = V-HINTS-NO>
<VERB-SYNONYM HINT HINTS CLUE CLUES INVISICLUES>

<CONSTANT RETURN-SEE-HINT " RETURN = see hint">
<CONSTANT RETURN-SEE-HINT-LEN <LENGTH " RETURN = see hint">>
<CONSTANT Q-MAIN-MENU "Q = main menu">
<CONSTANT Q-MAIN-MENU-LEN <LENGTH "Q = main menu">>
<CONSTANT INVISICLUES "INVISICLUES (tm)">
<CONSTANT INVISICLUES-LEN <LENGTH "INVISICLUES (tm)">>
<CONSTANT Q-SEE-HINT-MENU "Q = see hint menu">
<CONSTANT Q-SEE-HINT-MENU-LEN <LENGTH "Q = see hint menu">>
<CONSTANT Q-RESUME-STORY "Q = Resume story">
<CONSTANT Q-RESUME-STORY-LEN <LENGTH "Q = Resume story">>
<CONSTANT PREVIOUS "P = Previous">
<CONSTANT PREVIOUS-LEN <LENGTH "P = Previous">>

<GLOBAL LINE-TABLE		;"zeroth (first) element is 5"
	<PTABLE
	  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20 21 22>>

<CONSTANT COLUMN-TABLE		;"zeroth (first) element is 4"
	<PTABLE
	  4  4  4  4  4  4  4  4  4  4  4  4  4  4  4  4  4  4>>

; "If the first argument is non-false, build a parallel impure table
   for storing the count of answers already seen; make it a constant
   under the given name."

<DEFINE20 CONSTRUCT-HINTS (COUNT-NAME "TUPLE" STUFF "AUX" (SS <>)
			   (HL (T)) (HLL .HL) V
			   (CL (T)) (CLL .CL)
			   TCL TCLL)
   <REPEAT ((CT 0))
     <COND (<OR <EMPTY? .STUFF>
		<TYPE? <1 .STUFF> STRING>>
	    ; "Chapter break"
	    <COND
	     (<NOT .SS>
	      ; "First one, just do setup"
	      <SET SS .STUFF>
	      <SET TCL (T)>
	      <SET TCLL .TCL>
	      <SET CT 0>)
	     (T
	      <SET V <SUBSTRUC .SS 0 <- <LENGTH .SS> <LENGTH .STUFF>>>>
	      ; "One chapter's worth"
	      <SET HLL <REST <PUTREST .HLL (<EVAL <FORM PLTABLE !.V>>)>>>
	      <COND (.COUNT-NAME
		     <SET CLL <REST <PUTREST .CLL
					     (<EVAL <FORM TABLE (BYTE)
							  !<REST .TCL>>>)>>>
		     <SET TCL (T)>
		     <SET TCLL .TCL>
		     <SET CT 0>)>
	      <SET SS .STUFF>)>
	    <COND (<EMPTY? .STUFF> <RETURN>)>
	    <SET STUFF <REST .STUFF>>)
	   (T
	    <COND (.COUNT-NAME
		   <COND (<1? <MOD <SET CT <+ .CT 1>> 2>>
			  <SET TCLL <REST <PUTREST .TCLL
						   (0)>>>)>)>
	    <SET STUFF <REST .STUFF>>)>>
   <COND (.COUNT-NAME
	  <EVAL <FORM CONSTANT .COUNT-NAME
		      <EVAL <FORM PTABLE !<REST .CL>>>>>)>
   <EVAL <FORM PLTABLE !<REST .HL>>>>

;"longest hint topic can be 17 chars"
;"longest question can be 36 chars."
;"question can't have more than 32 answers"

<CONSTANT HINTS
   <CONSTRUCT-HINTS HINT-COUNTS  ;"Put topics in Quotes - followed by PLTABLEs
				   of Questions and Answers in quotes"
	"FESTERON"
	<PLTABLE "Someone in the Post Office is calling me. What should I do?"
		 "The Post Office door may give you a clue. EXAMINE it."
		 "Since the door is open, why not GO INSIDE and see who's calling?">
	<PLTABLE "Where is the Magick Stone?"
		 "That's for us to know, and for you to find out.">
	<PLTABLE "Who is Mr. Crisp?"
		 "He's your mean old boss."
		 "And he isn't very happy about your idle daydreaming."
		 "So you'd better do what he says.">
	;<PLTABLE "When should I open the envelope that came in my Wishbringer package?"
		 "The story will tell you. Patience! THERE IS NO ENVELOPE NOW">
	<PLTABLE "How do I get into the cemetery?"
		 "WALK INTO THE CEMETERY."
		 "You're not going to let the computer scare you away, are you?"
		 "Go on, chicken! WALK INTO THE CEMETERY and answer YES to the question.">
	<PLTABLE "Who is the gravedigger?"
		 "LOOK AT THE GRAVEDIGGER and find out.">
	<PLTABLE "How do I get the flowers out of the hearse?"
		 "Did you find the vase?"
		 "It may be hidden amongst the flowers in the hearse." 
		 "There aren't any flowers in the hearse."
		 "There's no hearse or vase, either."
		 "Don't let the presence or absence of questions, or the length of the answers, influence the way you play."> 
	<PLTABLE "What should I do with the umbrella?"
		 "It might come in handy if it rains."
		 "You can't WISH FOR RAIN unless you have an umbrella."
		 "So maybe you should hold onto it for later.">
	<PLTABLE "How do I get through the locked gate in the Twilight Glen?"
		 "The gravedigger has the only key to the gate."
		 "But the gravedigger is nowhere to be seen."
		 "You can't unlock the gate. To leave the cemetery, you must go out through the open gate at Creepy Corner.">
	<PLTABLE "Why won't the poodle let me near the cottage?"
		 "It wouldn't be much of a watchdog if it did, would it?">
	<PLTABLE "Why won't the poodle let me go north, into the village?"
		 "It doesn't like people walking past the cottage."
		 "It doesn't like mail clerks."
		 "It doesn't like you.">
	<PLTABLE "How do I get past the poodle?"
		 "I wouldn't PICK UP THE POODLE THEN KICK IT if I were you."
		 "Since violence doesn't work, maybe bribery will."
		 "You'll have to find something to bribe it with."
		 "Have you been to every location you can visit without getting past the poodle?"
		 "Have you looked all around the cemetery?"
		 "Have you investigated the open grave in the Spooky Copse?"
		 "The gravedigger won't let you into the grave while he's watching."
		 "Wait until the gravedigger goes away. Then GO INTO THE OPEN GRAVE."
		 "PICK UP THE OLD BONE. Bring it to the poodle and FEED THE BONE TO THE POODLE. Now you can GO NORTH into the village.">
	<PLTABLE "I left the envelope behind, and the poodle won't let me go back for it! What can I do?"
		 "You're not a very good mail clerk, are you?"
		 "There's no way to walk past the poodle once it has finished eating the bone."
		 "So you'll have to start all over again."
		 "RESTART. Next time, hold on to that envelope!">
	<PLTABLE "Who is Miss Voss?"
		 "She's in charge of the Festeron Town Library, curator of the Festeron Historical Museum, and author of the best-selling \"Local History Series\" of booklets, including The Legend of Wishbringer."
		 "Aren't you glad you asked?">
	<PLTABLE "Why won't Miss Voss give me back my library card?"
		 "She doesn't like mail clerks."
		 "She doesn't like you."
		 "What library card?">
	<PLTABLE "What should I do with the violet note?"
		 "Miss Voss asked you to give it to your boss, Mr. Crisp."
		 "But delivering the mysterious envelope is more important right now."
		 "So give the note to Mr. Crisp after you deliver the envelope.">
	<PLTABLE "Who is \"Corky\"?"
		 "It might be the name of Miss Voss's poodle."
		 "But why would Miss Voss write a note to her dog?"
		 "Since Miss Voss asked you to give the note to Mr. Crisp, and the note is addressed to \"Corky,\" it's probably Mr. Crisp's nickname.">
	<PLTABLE "How do I get inside the Library?"
		 "Miss Voss probably has the key."
		 "Unfortunately, Miss Voss isn't around any more."
		 "You don't have time to fool around with the Library right now. The Magick Shoppe closes at five o'clock!"
		 "Be patient; maybe you can get inside after you deliver the envelope.">
	<PLTABLE "Who is Sgt. MacGuffin?"
		 "He's in charge of Festeron's Police Department.">
	<PLTABLE "How do I get the chocolate?"
		 "Simply TAKE THE CHOCOLATE OFF THE DESK."
		 "Of course, Sgt. MacGuffin might have other ideas."
		 "Have you tried examining Sgt. MacGuffin?"
		 "Wait until Sgt. MacGuffin falls asleep before taking the chocolate.">
	<PLTABLE "What should I do in the Park?"
		 "The statue in the middle of the fountain is interesting."
		 "But not as interesting as the other objects in the fountain."
		 "LOOK INSIDE THE FOUNTAIN."
		 "The rest is up to you.">
	<PLTABLE "How do I catch the goldfish?"
		 "Unfortunately, you won't find a net or pole anywhere."
		 "What makes you think you have to catch the goldfish?">
	<PLTABLE "The movie theater is closed! How do I get inside?"
		 "The schedule might give you a hint."
		 "The theater opens at seven o'clock. Come back later.">
	<PLTABLE "Why can't I take things out of the big mailbox?"
		 "Public mailboxes are built to discourage prying fingers like yours.">
	<PLTABLE "How do I play the video game?"
		 "By scoring as many points as you can."
		 "Naturally, you'll have to put a token in the video machine before you can play."
		 "Isn't it getting awfully close to five o'clock?">
	<PLTABLE "What do I do with the seahorse?"
		 "If you don't do something quickly, it will probably die."
		 "A seahorse can't live long out of water."
		 "PICK UP THE SEAHORSE THEN THROW IT INTO THE BAY.">
	<PLTABLE "What happened to the church mouse?"
		 "It ran away when it saw you. Surprised?">
	<PLTABLE "How do I get the candle?"
		 "Try to TAKE THE CANDLE."
		 "Try to STEAL THE CANDLE."
		 "Taking things that don't belong to you is stealing, especially in a church."
		 "At the moment, you can't steal the candle.">
	<PLTABLE "What should I do with the pile of leaves?"
		 "Did you notice the message in the sand near the leaves?"
		 "Are you going to do what the message says?"
		 "You might be sorry if you don't.">
	<PLTABLE "Who wrote the message in the sand?"
		 "The person who wrote the message was obviously very concerned that somebody like you might come along and disturb the pile of leaves.  Aside from this acute observation, the author of the message is not important.">
	<PLTABLE "How do I get to Misty Island?"
		 "If you had a bathing suit you could put it on and swim over."
		 "No bathing suit, eh? Oh, well. You'll just have to wait for the Misty Island ferry."
		 "Charter a private seaplane, preferably one equipped with a wet bar and jacuzzi."
		 "If all else fails, give up."
		 "But watch for new opportunities after you deliver the envelope.">
	<PLTABLE "What do I do with the horseshoe?"
		 "Keep it. It might bring you good luck."
		 "Especially if you use it to WISH FOR LUCK after you find the Magick Stone.">
	<PLTABLE "How do I get into the lighthouse?"
		 "It's a phoney lighthouse. You can't go into it."
		 "Ever."
		 "So stop trying.">
	<PLTABLE "What should I feed to the pelican?"
		 "A flapping, juicy fish would be nice if you can find one."
		 "The only fish you'll find is in the fountain."
		 "Unfortunately, you can't get the fish in the fountain."
		 "What makes you think the pelican is hungry?">
	<PLTABLE "What's the easiest way into the impenetrable forest?"
		 "Look up the word \"impenetrable\" in a dictionary.">
	<PLTABLE "What can I do with the gnarled, rotten tree?"
		 "You can always CLIMB THE GNARLED TREE."
		 "Maybe you should have examined the tree first.">
	<PLTABLE "What can I do with the dead branch?"
		 "It probably won't help you deliver the envelope any faster."
		 "But it's a good idea to remember where it is. You might find a use for it later.">
	<PLTABLE "Mr. Crisp just fired me! What did I do wrong?"
		 "You failed to deliver the envelope on time, or didn't read it to the old woman. Next time, make sure you're in the Magick Shoppe before five o'clock, and do what the old woman asks you to do!">
	"YE OLDE MAGICK SHOPPE"
	<PLTABLE "Why is \"Magick\" spelled with a \"k\"?"
		 "Because."
		 "Oh, all right. \"Magick\" is an archaic spelling popularized by Aleister Crowley (a 20th century occultist) and occasionally seen in pulp fantasies and tales of horror. It's supposed to imply an especially old and potent variety of supernatural force.">
	<PLTABLE "How do I get into the Magick Shoppe?"
		 "Just OPEN THE DOOR THEN GO INSIDE.">
	<PLTABLE "A gust of wind blew the door shut! How do I open it again?"
		 "You can't open it by yourself."
		 "Relax. Maybe somebody will come along and open it for you.">
	<PLTABLE "How do I take the naughty birthday cards?"
		 "By removing them from the glass case."
		 "Unfortunately, you can't reach into the glass case."
		 "So you can't take the naughty birthday cards."
		 "You rascal.">
	<PLTABLE "Why can't I approach the curtain?"
		 "Maybe it doesn't like mail clerks."
		 "It's enchanted in such a way as to discourage nosey visitors.">
	<PLTABLE "Who is the old woman?"
		 "She's the proprietor of the Magick Shoppe."
		 "The mysterious envelope is addressed to her."
		 "So maybe you ought to give her the mysterious envelope.">
	<PLTABLE "Why did the Shoppe become strangely quiet all of a sudden?"
		 "A noise stopped."
		 "A nearby mechanism stopped working."
		 "EXAMINE THE GRANDFATHER CLOCK."
		 "The clock stopped when the old woman appeared. Creepy, isn't it?">
	<PLTABLE "I found a bug! The clock on my status line stopped. Should I call Infocom?"
		 "It's not a bug. See the previous question for details."
		 "If it was a bug, you could blame it on one of the Infopeople who tested the game. In alphabetical order, they are:"
		 "\"Hollywood\" Dave Anderson, Manager"
		 "Joanne Avtges"
		 "Gary Brennan"
		 "Amy Briggs"
		 "Mark \"Max\" Buxton"
		 "Liz Cyr-Jones"
		 "Suzanne Frank"
		 "Jeff O'Neill"
		 "Plus dozens of beta- and gamma-testers too numerous to list.">
	<PLTABLE "Who is \"The Evil One?\""
		 "She's the person who mailed the mysterious envelope."
		 "She kidnapped the old woman's pet cat, and is demanding a Magick Stone for ransom."
		 "If she doesn't get the Stone before the moon sets, she'll probably do something awful to the cat."
		 "Doesn't sound like a very nice person, does she?">
	<PLTABLE "What should I do with the metal can?"
		 "Like all objects in the story, you should EXAMINE it."
		 "The rest is up to you.">
	<PLTABLE "Why does the metal can rattle?"
		 "Maybe there are some yummy mixed nuts inside."
		 "Then again, maybe not."
		 "There's something built into the can that makes it rattle. It's designed to lure innocent victims to their doom by making them believe there may be nuts inside.">
	<PLTABLE "Why can't I move when the old woman touches my forehead?"
		 "She's casting a subtle hypnotic spell on you."
		 "So shut up and pay attention.">
	<PLTABLE "Who is \"Chaos\"?"
		 "It's the name of the old woman's pet cat."
		 "It's also the name of Dan Horn's pet skunk.">
	<PLTABLE "Who is Dan Horn?"
		 "He's the owner of a pet skunk named Chaos."
		 "He worked at Infocom when \"Wishbringer\" was written."
		 "He paid $10.00 to see his name on-line."
		 "(This space for sale.)">
	<PLTABLE "The clock on my status line just went crazy! What's going on?"
		 "It's not a bug."
		 "It's a feature."
		 "It's the sort of thing that happens in Magick Shoppes.">
	
	"WITCHVILLE"
	<PLTABLE "What happened to Festeron? Everything's changed!"
		 "Exactly."
		 "The village seems to have come under an evil, supernatural influence."
		 "The influence's initials are T.E.O."
		 "The \"T\" stands for \"The,\" and the \"O\" stands for \"One.\""
		 "Sorry. You have to figure out the \"E\" yourself.">
	<PLTABLE "Where is Wishbringer, the Magick Stone?"
		 "It may be a lot closer than you think."
		 "It seems odd that the old woman didn't simply give it to you, doesn't it?"
		 "Maybe the old woman gave it to you without telling you."
		 "Have you noticed a persistent rattling sound?"
		 "Have you investigated the metal can since you left the Magick Shoppe?"
		 "Have you looked inside the metal can?"
		 "OPEN THE METAL CAN. SQUEEZE IT.">
	<PLTABLE "Where is The Evil One?"
		 "Don't worry. She'll find you.">
	<PLTABLE "Who is Thermofax?"
		 "He's a fire-breathing dragon mentioned in The Legend of Wishbringer and the opening title screen.">
	<PLTABLE "Thermofax won't leave me alone! What should I do?"
		 "Throw the Magick Stone into his open maw."
		 "If that doesn't work, throw yourself into his open maw."
		 "Except for brief mentions in The Legend of Wishbringer and the opening title screen, Thermofax does not appear in the story.">
	<PLTABLE "How do I get down the steep trail? It's too foggy to see!"
		 "Use the map you drew on your way up the trail."
		 "You did take the story's advice when it told you to draw a map, didn't you?"
		 "If you forgot to draw a map, you can still feel your way down the steep trail. But it won't be easy. And you might die trying."
		 "There's another, safer way to get down the trail without a map."
		 "You'll need the Magick Stone."
		 "One of the Seven Wishes can clear the fog away."
		 "If you're holding Wishbringer and an open umbrella, you can WISH FOR RAIN. The resulting downpour will clear the fog and transport you to the bottom of the cliff.">
	<PLTABLE "What's the significance of the vulture?"
		 "It's watching you."
		 "Doesn't that make you uneasy?"
		 "It ought to. The vulture is The Evil One's spy.">
	<PLTABLE "How do I get past the toll gate?"
		 "Why not just pay the troll?"
		 "The troll won't take your gold coin? Gee. Tough luck."
		 "Maybe there's something else you can give the troll."
		 "What about the metal can?"
		 "Troll still bothering you? This just isn't your lucky day."
		 "There are three ways to get past the troll."
		 "Two of the ways involve using the Magick Stone."
		 "The other way doesn't."
		 "The troll may or may not bother to examine your gold coin."
		 "If you're lucky, he won't examine it."
		 "If you're holding Wishbringer and the horseshoe, and you WISH FOR LUCK before giving the coin to the troll, the troll won't bother to examine the coin."
		 "Another way past the troll is to WISH FOR DARKNESS. It will scare him away."
		 "You can't WISH FOR DARKNESS until you've found the grue's milk."
		 "You won't find the milk until after you get past the troll."
		 "Using the Darkness Wish to get past the troll is only useful if you have to go past him twice."
		 "If you've already released the snake, you'll have to use Magick."
		 "The non-Magick way is to give the closed metal can to the troll, or to open it in front of him. The snake will scare him away.">
	<PLTABLE "What is the significance of the giant stump?"
		 "It affords an excellent view of the surrounding area."
		 "Have you examined it lately?"
		 "OPEN THE STUMP. Surprise!">
	<PLTABLE "What is a grue?"
		 "The grue is a sinister, lurking presence in the dark places of the earth. Its favorite diet is Adventurers, but its insatiable appetite is tempered only by its fear of light.  No grue has ever been seen by the light of day, and few have survived its fearsome jaws to tell the tale.">
	<PLTABLE "How do you milk a grue?"
		 "Very carefully."
		 "Fortunately, you don't have to milk a grue to finish the story.">
	<PLTABLE "Where do I find the grue's milk?"
		 "Grue's milk must be kept in a cool, well-lighted place to stay spoiled."
		 "Grue refrigerators are cool and well-lighted."
		 "There's a grue refrigerator in the Grue's Nest.">
	<PLTABLE "How do I get the grue's milk without being devoured?"
		 "Avoid waking up the beast with light or noise."
		 "The light source you're carrying is waking up the beast."
		 "Cover the beast so it can't see."
		 "Blankets make an excellent cover."
		 "Get the blanket in the Jail Cell. COVER THE BEAST WITH THE BLANKET before it wakes up.">
	<PLTABLE "How do I get around in the dark?"
		 "You'll need a source of light."
		 "Have you found the small stone yet?"
		 "Have you examined it?"
		 "There's another, more conventional source of light."
		 "It's in the church."
		 "Go into the church and STEAL THE CANDLE.">
	<PLTABLE "Why can't I blow out the candle?"
		 "It's magic."
		 "It's Magick.">
	<PLTABLE "What is the Boot Patrol?"
		 "Stay in one place for a while. You'll find out.">
	<PLTABLE "The Boot Patrol threw me in jail! How do I get out?"
		 "Maybe you're not the first person who's tried to escape."
		 "Have you investigated everything in the Jail Cell?"
		 "Have you looked under everything?"
		 "LOOK UNDER THE BUNK."
		 "If this is the first time you've been thrown in jail, just MOVE THE BUNK THEN GO INTO THE HOLE."
		 "If not, you'll find that the hole has been cemented over. Now you'll need Magick to get out of the Jail Cell."
		 "One of the Seven Wishes might work."
		 "EAT THE CHOCOLATE THEN WISH FOR FREEDOM."
		 "If you don't have the chocolate or Wishbringer handy, relax. The Boot Patrol will be along in just a few moves, and all your troubles will be over.">
	<PLTABLE "How do I get rid of the big mailbox?"
		 "Give it what it wants."
		 "Give it mail."
		 "Give it stamped mail."
		 "There's another mailbox with some stamped mail in it."
		 "Find a shimmering trail."
		 "The shimmering trail is at the Rocky Path."
		 "OPEN THE SMALL MAILBOX. TAKE THE LEAFLET OUT OF THE BOX. Go to the big mailbox and FEED THE LEAFLET TO THE BIG MAILBOX."
		 "Congratulations. You have a new companion.">
	<PLTABLE "Why is the small mailbox following me around?"
		 "It likes mail clerks."
		 "It likes you.">
	<PLTABLE "How do I get through the Cemetery?"
		 "Did somebody warn you about going in there after dark?"
		 "You can't get through the Cemetery. It's a trap.">
	<PLTABLE "What is an eldritch vapor?"
		 "Any relation to Eldridge Cleaver?"
		 "They're mischievous but generally harmless ghosts that hang around cemeteries at night, annoying passersby with supernatural tricks.">
	<PLTABLE "The eldritch vapors stole everything I was carrying! What should I do?"
		 "Have you looked around the village?"
		 "Everywhere?"
		 "The vapors will scatter your possessions randomly around the village, always outdoors.  Pesty little critters, aren't they?">
	<PLTABLE "What's inside the pit?"
		 "Maybe you should LOOK INSIDE THE PIT."
		 "If you found a platypus, congratulations."
		 "If not, you must have disturbed the pile of leaves that used to cover the pit. Shame on you!"
		 "You can't possibly finish the story if you disturbed that pile of leaves."
		 "RESTART. Next time, heed the message in the sand!">
	<PLTABLE "What is a platypus?"
		 "Look it up in an encyclopedia."
		 "A platypus has webbed feet, a flat tail, dense fur, and a bill that looks like a duck's bill."
		 "Amazing, aren't they?">
	<PLTABLE "What is the plural of \"platypus\"?"
		 "Platypuses."
		 "Platypi."
		 "Both platypuses and platypi are correct.">
	<PLTABLE "What do I do with the platypus?"
		 "Maybe you don't have to do anything with it."
		 "Unless you want to finish the story."
		 "It'd be really nice if you rescued the platypus."
		 "Not as easy as it sounds, eh?"
		 "There are two ways to rescue the platypus."
		 "One of them involves the use of Magick."
		 "Platypuses are great swimmers."
		 "If you filled the pit with water, the platypus might be smart enough to swim out."
		 "One of the Seven Wishes might help you fill the pit with water."
		 "While standing at Edge of Lake, OPEN THE UMBRELLA THEN WISH FOR RAIN."
		 "If you don't have the umbrella or Wishbringer, or if you've already used the Rain Wish, you'll have to find another way to rescue the platypus."
		 "How deep is the pit?"
		 "There's something you can get that might help you reach into the pit."
		 "Did you notice the dead branch at Cliff Bottom?"
		 "PUT THE BRANCH IN THE PIT. The platypus will hold on to the end of the branch. PULL THE BRANCH OUT OF THE PIT.">
	<PLTABLE "Why are there so many platypuses in the story and packaging?"
		 "That's what our marketing department wanted to know."
		 "But we wouldn't explain it to them."
		 "And we won't explain it to you, either."
		 "Marketing Department's Note:  Actually, Brian Moriarty is a bit strange, and we decided it was best to humor him.">
	<PLTABLE "What should I do with the silver whistle?"
		 "What silver whistle?"
		 "Oh, that silver whistle! Well, you can always EXAMINE THE WHISTLE."
		 "If you're really adventurous, you could even (dare we suggest it?) try to BLOW THE WHISTLE."
		 "If nothing happens the first time you blow the whistle, EXAMINE THE WHISTLE. Then take the whistle to the place where you found it, and EXAMINE THE WHISTLE again."
		 "The whistle only twinkles when you're at Edge of Lake."
		 "BLOW THE WHISTLE only when it's twinkling ... unless you just like to hear the music.">
	<PLTABLE "How do I get to Misty Island?"
		 "Read the above hint. You may discover something unexpected.">
	<PLTABLE "What should I say to King Anatinus?":
		 "You don't need to say anything. Just do what he says."
		 "If he offers you a gift, take it."
		 "TAKE THE HAT."
		 "If he asks you to do anything, do it."
		 "BLOW THE WHISTLE."
		 "Don't annoy the King. You might be sorry.">
	<PLTABLE "What should I do with the wizard's hat?"
		 "Do what the King told you to do."
		 "Take the hat to the pelican."
		 "GIVE THE HAT TO THE PELICAN.">
	<PLTABLE "What is the significance of the pelican?"
		 "Read the above hint.">
	<PLTABLE "How do I get into the movie theater?"
		 "There are two ways into the movie theater."
		 "The first way into the theater involves the use of Magick."
		 "Go into the theater lobby and WISH FOR DARKNESS. You can sneak inside while the gravedigger is stumbling around in the dark."
		 "Or GIVE THE GOLD COIN TO MISS VOSS. GO INSIDE. GIVE THE TICKET TO THE GRAVEDIGGER. GO INTO THE THEATER.">
	<PLTABLE "The movie is all fuzzy and indistinct! What's wrong?"
		 "Did you read the marquee outside the theater?"
		 "Did you examine the empty carton in the lobby?"
		 "This is a 3D movie. You need a pair of 3D glasses to see it."
		 "Did you look inside the carton in the lobby?"
		 "Oh, well. Looks like they're all gone. But maybe somebody dropped a pair somewhere."
		 "Have you searched everywhere in the theater?"
		 "LOOK UNDER THE SEATS.">
	<PLTABLE "Where can I get a token for the video arcade?"
		 "Ask one of the humanoids. They seem to have plenty of tokens."
		 "Oh, well. Maybe somebody dropped one somewhere."
		 "Have you been to the Park lately?"
		 "LOOK IN THE FOUNTAIN.">
	<PLTABLE "I found the token! How do I get it?"
		 "Simply TAKE THE TOKEN OUT OF THE FOUNTAIN."
		 "But the piranha might have other ideas."
		 "Remember the poodle?"
		 "Maybe you can distract the piranha the same way you distracted the poodle."
		 "It's not likely that the piranha would be interested in a bone."
		 "But it might be interested in something else."
		 "If you were a fish, what would you be interested in?"
		 "Have you found the grue's milk yet?"
		 "Have you visited the Grue's Nest yet?"
		 "There's more than one item in the grue refrigerator."
		 "TAKE THE WORM OUT OF THE REFRIGERATOR. Then go to the Park and FEED THE WORM TO THE PIRANHA. The piranha will leave you alone long enough to TAKE THE TOKEN OUT OF THE FOUNTAIN.">
	<PLTABLE "How do I play the video game?"
		 "It would help if you turned on the machine."
		 "PUT THE TOKEN IN THE SLOT."
		 "Have you tried to EXAMINE THE SCREEN?"
		 "The screen looks just like the map in your Wishbringer package."
		 "Did you EXAMINE THE STAR?"
		 "Did you EXAMINE THE JOYSTICK?"
		 "To experiment, try to PUSH THE JOYSTICK TO THE WEST. Then EXAMINE THE STAR."
		 "Maneuver the star to an interesting square on the grid. When you're satisfied, PUSH THE BIG RED BUTTON."
		 "You're not afraid of a bunch of stunted humanoids, are you? Go on! PUSH THE BUTTON!"
		 "Most of the squares in the video game aren't very interesting."
		 "But one of them is VERY interesting."
		 "Move the star to square C-5, which is over the Post Office on the map. Then PUSH THE BUTTON. You'll end up outside the Tower, without having to get past the hellhound.">
	<PLTABLE "The hellhound won't let me past! What can I do?"
		 "Maybe you can bribe the hellhound the same way you bribed the poodle."
		 "Then again, maybe not."
		 "There are three ways to get past the hellhound."
		 "One of them involves Magick."
		 "One of the Seven Wishes might help you."
		 "WISH FOR DARKNESS while standing outside the cottage. The hellhound will cower in fear long enough for you to get past."
		 "Another way involves the video game in the arcade."
		 "Refer to the previous hint for instructions on how to play the video game."
		 "The last way to get past the hellhound only works if you've already been inside the Tower."
		 "Have you read all of the mail in the story?"
		 "Have you read the violet note?"
		 "You can't open the violet note yourself."
		 "Wait until Mr. Crisp opens the violet note. After he leaves, read the note."
		 "Then go to the hellhound and say ALEXIS, HEEL. The hellhound will become considerably less ferocious.">
	
        "THE TOWER"
	<PLTABLE "How do I get into the Tower?"
		 "Didn't King Anatinus say something about getting into the Tower?"
		 "You need a Word of Power."
		 "The pelican knows what it is."
		 "The pelican won't give you the Word unless you give it something in return."
		 "GIVE THE WIZARD'S HAT TO THE PELICAN. A Word will be revealed to you. Go to the tower and say the word (just type it in). The drawbridge will lower automatically.">
	<PLTABLE "How did the Princess get captured again?"
		 "She isn't a very smart platypus, is she?">
	<PLTABLE "Help! Mr. Crisp is getting ready to torture me!"
		 "He's sleazy enough to take a bribe."
		 "Didn't somebody ask you to give him something a long time ago?"
		 "GIVE THE VIOLET NOTE TO MR. CRISP.">
	<PLTABLE "Mr. Crisp is gone, but I'm still in chains! What should I do?"
		 "There are two ways to get out of the chains."
		 "One of them involves Magick."
		 "WISH FOR FREEDOM will work."
		 "But you wouldn't need Magick if you had the key to the chains."
		 "Mr. Crisp dropped the key in his lab coat, remember?"
		 "He dropped the lab coat on the floor."
		 "PICK UP THE WHITE LAB COAT. TAKE THE KEY OUT OF THE COAT. UNLOCK THE CHAINS WITH THE KEY.">
	<PLTABLE "Where did Mr. Crisp go?"
		 "He went to visit his sweetheart, Miss Voss."
		 "But who cares, as long as he isn't here to torture you?">
	<PLTABLE "How do I free the Princess from the torture machine?"
		 "Just do what she says."
		 "PULL DOWN THE LEVER.">
	<PLTABLE "How do I get out of the torture chamber?"
		 "The same way Mr. Crisp did."
		 "OPEN THE HATCH. CLIMB UP THE LADDER.">
	<PLTABLE "What is the significance of the paintings in the Round Chamber?"
		 "The story they illustrate may sound vaguely familiar."
		 "Especially if you read The Legend of Wishbringer."
		 "The paintings also conceal an important secret."
		 "LOOK BEHIND A PAINTING.">
	<PLTABLE "The drawbridge is closed! How do I get out of the Tower?"
		 "Read the previous hint for clues.">
	<PLTABLE "The suit of armor is chasing me! What should I do?"
		 "Hit it with the dead branch."
		 "Throw the stone at it."
		 "Light the grue's milk on fire with the candle, then give the milk to the suit of armor to drink. It'll still chase you, but at least it will be laughing."
		 "There is no suit of armor in this story.">
	<PLTABLE "Why is the room above the Round Chamber all blurry?"
		 "Blurry, huh? Gee. Maybe you need glasses."
		 "PUT ON THE 3D GLASSES after you walk into the blurry room.">
	<PLTABLE "What should I do with the telescope in the Laboratory?"
		 "You could ignore it. It's probably just a prop."
		 "The telescope is just a prop."
		 "So ignore it!">
	<PLTABLE "What is the significance of the bubbling chemicals?"
		 "They're not significant at all. Leave them alone.">
	<PLTABLE "What is the purpose of the control panel?"
		 "It has two switches, so it probably controls two things."
		 "Have you examined both of the switches?"
		 "The first switch controls the power in the Palace Theater. (If you watched the entire movie, you'd already know this.)"
		 "The second switch controls the "security" for something. Hmm. Wonder what the Evil One wants to keep secure ..."
		 "TURN OFF THE SECOND SWITCH.">
	
	"THE LIBRARY"
	<PLTABLE "How do I get into the Library?"
		 "Wait until Miss Voss opens it tomorrow morning."
		 "Unfortunately, you haven't got time to wait. Looks like you'll have to unlock the front door somehow."
		 "Miss Voss locked it earlier. Maybe she put the key somewhere."
		 "Have you visited Miss Voss's cottage yet?"
		 "It's easy to get into the cottage once you tame the hellhound. (But that's another hint.)"
		 "The key to the Library is on Miss Voss's bookcase.">
	<PLTABLE "How can I see in the Library? It's Dark."
		 "The candle is a source of light."
		 "Too bad the candle fizzles out when the Library door closes."
		 "Wishbringer is also a source of light."
		 "If you haven't found the Stone yet, you're in trouble. But there is another way to see in the Library."
		 "Have you examined the wizard's hat?"
		 "Have you looked inside the wizard's hat?"
		 "Have you dropped anything inside the wizard's hat?"
		 "Things you drop into the wizard's hat disappear. But they might turn up someplace else."
		 "Things you drop into the hat appear in the Museum's display case."
		 "DROP THE CANDLE INTO THE WIZARD'S HAT before it gets blown out. You can later retrieve the candle for use as a source of light.">
	<PLTABLE "Where's the key to unlock the circulation desk?"
		 "The steel key might work. After all, it unlocked the library door."
		 "Then again, why should a door key work in a desk?"
		 "There is no desk key. You can't open the circulation desk.">
	<PLTABLE "How do I get the spider out of the Library books?"
		 "You'll have to pick up the books first."
		 "You'll need a library card to take the books."
		 "Shucks! You forgot your library card."
		 "There isn't any spider in the library books."
		 "Or anywhere else, either.">
	<PLTABLE "How do I open the glass display case in the Museum?"
		 "Did you try the rusty key?"
		 "Did you try the steel key?"
		 "Did you try the key in the circulation desk?"
		 "Did you read the above hint about unlocking the circulation desk?"
		 "You can't unlock the display case."
		 "Force may be necessary."
		 "You'll need a heavy object to break the case."
		 "Try BREAK THE DISPLAY CASE WITH THE HORSESHOE. You can also use the broom, the umbrella, the conch shell, the bottle or the dead branch."
		 "Naturally, you remembered to EXAMINE THE DISPLAY CASE before breaking it."
		 "You must deactivate the security system before breaking the case."
		 "The switch for the security system is in the Laboratory.">
	<PLTABLE "How do I get out of the library with the sculpture?"
		 "Try unlocking the door."
		 "Lock's on the outside? Oh, well. Why not WISH FOR FLIGHT?"
		 "Nope, you're indoors. But you can still WISH FOR FREEDOM."
		 "Not confined, eh? There must be another way out, then."
		 "Have you tried to EXAMINE THE SCULPTURE yet?"
		 "Go on to the next hint.">
	<PLTABLE "What should I do with the sculpture?"
		 "Such a fine work of art should probably be examined."
		 "Hmm. Seems to be a piece missing."
		 "Have you tried to WISH FOR ADVICE?"
		 "Have you tried to WISH FOR FORESIGHT?"
		 "Something might fit into the forehead of the statue."
		 "PUT THE STONE INTO THE FOREHEAD.">
	<PLTABLE "Who's the old woman in the Library?"
		 "She looks familiar, but somewhat fuzzy."
		 "What can you do to make fuzzy things clearer?"
		 "PUT ON THE 3D GLASSES."
		 "Yipes!">
	<PLTABLE "How do I escape from the sinister being?"
		 "Just walk right past her. She won't mind."
		 "Much."
		 "You could try bribing her with something."
		 "Maybe she'll accept that nice, glowing stone you're holding."
		 "But if you want to finish the story, you won't give it to her."
		 "Stop fooling around! Kill her before she turns you into something awful!"
		 "Too tough, eh? Maybe you should continue what you were doing before she interrupted."
		 "PUT THE STONE INTO THE FOREHEAD."
		 "Don't listen to her! PUT THE STONE INTO THE FOREHEAD!">
	
	"THE SEVEN WISHES"
	<PLTABLE "What Advice can I get from the shell?"
		 "There are seven bits of Advice. In order of appearance, they are:"
		 "1. \"If ye hath not kept a Map, only patience or Magick can help thee.\""
		 "2. \"Magick may help thee cross the Bridge.\""
		 "3. \"Release a Prisoner, and be Rewarded.\""
		 "4. \"Learn the Word of Power, else never gain the Tower.\""
		 "5. \"One path Magick, one path Science; both lead to thy Goal.\""
		 "6. \"Many wonders await thee in the Halls of Knowledge.\""
		 "7. \"Fit the Pieces together, and the Puzzle is complete.\"">
	<PLTABLE "Where is WISH FOR RAIN useful?"
		 "If you're lost in the fog, wishing for Rain will wash you safely down to the Cliff Bottom."
		 "If you're at Edge of Lake, wishing for Rain will fill the narrow pit with water and free any creatures that may be trapped there."
		 "Wishing for Rain anywhere else is harmless, but the downpour might irritate nearby characters.">
	<PLTABLE "When should I WISH FOR FLIGHT?"
		 "Whenever you want to go back to the Magick Shoppe. Just make sure you're outdoors (or in the Laboratory), and off you go!"
		 "It's not a good idea to go back to the Magick Shoppe until you've found Chaos, the old woman's black cat."
		 "Make sure the black cat you've found is the right one."
		 "If you locate the real Chaos, you won't need to WISH FOR FLIGHT."
		 "So you'll never need to WISH FOR FLIGHT. It's a trap.">
	<PLTABLE "Why would I want to WISH FOR DARKNESS?"
		 "Some characters might not like the sudden Darkness."
		 "One of them is the troll at the toll gate."
		 "If you WISH FOR DARKNESS with the troll present, he'll run away across the bridge."
		 "The gravedigger is afraid of the dark, too."
		 "If you WISH FOR DARKNESS in the Theater Lobby, you may be able to sneak past the terrified gravedigger into the theater. (Not a very good movie usher, is he?)"
		 "There's one other creature who doesn't like Darkness."
		 "It's the hellhound."
		 "If you WISH FOR DARKNESS at Outside Cottage, the hellhound will cower in fear long enough for you to sneak past.">
	<PLTABLE "What happens when I WISH FOR FORESIGHT?"
		 "You get a tantalizing, heavily symbolic glimpse of the future, all mixed up with snippets of the past and present."
		 "Don't worry about what it means."
		 "It's a dream sequence.">
	<PLTABLE "Why didn't the WISH FOR MAGICK work?"
		 "You weren't holding Wishbringer."
		 "You weren't holding the Magick Wand."
		 "You didn't wave the Magick Wand over the Magick Rutabaga."
		 "Magick Wand? Magick Rutabaga? WISH FOR MAGICK?">
	<PLTABLE "Why should I WISH FOR LUCK?"
		 "Luck gives you all sorts of little benefits that make it easier to finish the story."
		 "There are five ways the WISH FOR LUCK can help you."
		 "The five ways are:"
		 "1. If you're Lucky, the troll won't notice that your gold coin is a \"counterfeit.\""
		 "2. If you scare the troll away by wishing for Darkness, he'll drop your gold coin on the bridge ... but only if you're Lucky."
		 "3. Normally, the eldritch vapors in the cemetery will carry you away and scatter all your possessions once they've taken a good look at you. But if you're Lucky, they'll steal your possessions, one at a time, before they carry you away."
		 "4. The hellhound will eat you up if you hang around for more than three moves. But if you're Lucky, it'll just keep roaring at you."
		 "5. Your chances of being eaten by a grue in the dark are much lower if you're Lucky.">
	<PLTABLE "I just neutralized my Luck Wish! What should I do?"
		 "Next time, avoid opening the umbrella indoors or walking under the ladder. These are very Unlucky things to do.">
	<PLTABLE "Where should I WISH FOR FREEDOM?"
		 "It only works in two situations."
		 "If you're thrown in jail more than once, the only way out is to WISH FOR FREEDOM. You'll usually end up on Lookout Hill (unless the Boot Patrol is there, in which case the Stone will thoughtfully deposit you outside the Police Station)."
		 "You can also free yourself from the chains in the Torture Chamber with a WISH FOR FREEDOM."
		 "Just make sure Mr. Crisp isn't there when you try it.">
	
	"HOW POINTS ARE SCORED"
	<PLTABLE "ACTION: POINTS"
		 "Enter the Post Office: 1"
		 "Take the mysterious envelope: 5"
		 "Take the old bone: 1"
		 "Feed the bone to the poodle: 3"
		 "Take the note from Miss Voss:  3"
		 "Take the gold coin: 1"
		 "Arrive at Cliff Edge: 1"
		 "Give envelope to old woman: 5"
		 "Read letter to old woman: 1"
		 "Take metal can from old woman: 3"
		 "Frighten troll with snake: 3"
		 "Take the small stone: 5"
		 "Remove dead branch from pit: 5"
		 "Take the silver whistle: 3"
		 "Take the wizard's hat: 1"
		 "Give wizard's hat to pelican: 5"
		 "Buy ticket: 3"
		 "Take the 3D glasses: 3"
		 "Take the blanket: 3"
		 "Cover beast with blanket: 3"
		 "Take the earthworm: 3"
		 "Take token from fountain: 3"
		 "Put token in arcade machine: 1"
		 "Transport to Hilltop: 5"
		 "Open the drawbridge: 3"
		 "Take the rusty key: 3"
		 "Unlock your chains: 1"
		 "Read the violet note: 3"
		 "Turn the crank: 1"
		 "Turn off second power switch: 3"
		 "\"Alexis, heel.\": 5"
		 "Take the steel key: 3"
		 "Unlock the library door: 3"
		 "Put small stone in sculpture: 5">
	<PLTABLE "HOW POINTS ARE LOST"
		 "ACTION: POINTS"
		 "Fail to take the violet note: -10"
		 "Disturb the pile of leaves: -10"
		 "Give small stone to vulture: -10"
		 "Give small stone to pelican: -10"
		 "Torture the Princess: -10"
		 "Torture the black cat: -10"
		 "Feed grue's milk to Chaos: -10">
	
	"FOR YOUR AMUSEMENT"
	<PLTABLE "Have you tried:"
		 "Reading the theater marquee before delivering the envelope?"
		 "Listening to the conch shell before delivering the envelope?"
		 "Examining the grandfather clock repeatedly?"
		 "Examining the video game in Festeron? In Witchville?"
		 "Opening the metal can inside the Magick Shoppe?"
		 "Examining the wanted posters in Festeron? In Witchville?"
		 "Staying in the Jail Cell after being captured by the Boot Patrol?"
		 "Getting captured three times by the Boot Patrol, after savingthe seahorse? Without saving the seahorse?"
		 "Ignoring King Anatinus? Dropping the whistle or the hat?"
		 "Letting the small mailbox meet the big mailbox?"
		 "Looking around the Museum after the mailboxes have met? If the mailboxes never met?"
		 "Leaving things in either mailbox, letting the boxes meet, and looking inside the fossil afterward?"
		 "Putting things inside the wizard's hat? And finishing the story?"
		 "Trying to KILL THE STUNTED HUMANOIDS?"
		 "Dropping the lighted candle into the bay, lake or river?"
		 "Wishing for freedom while Mr. Crisp is watching?"
		 "Pushing the lever on the torture machine UP while the Princess was clamped inside?"
		 "Putting interesting objects (like the black cat) into the torture machine, and pushing the lever up?"
		 "Torturing the Princess and the black cat at the same time?"
		 "Pouring out the grue's milk near the black cat? Near Chaos?"
		 "Putting on the 3D glasses just before you put the stone into the sculpture? And then NOT putting it in?"
		 "Giving the stone to the old woman in the Museum?">>>


<GLOBAL CUR-POS 0>	;"determines where to place the highlight cursor
			  Can go up to 17 Questions"

<GLOBAL QUEST-NUM 1>    ;"shows in HINT-TBL ltable which QUESTION it's on"

<GLOBAL CHAPT-NUM 1>	;"shows in HINT-TBL ltable which CHAPTER it's on"

<CONSTANT DIROUT-TBL
	  <TABLE 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
	       0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 >>

<ROUTINE V-HINTS-NO ()
	<COND (<NOT <PRSO? ,ROOMS>>
	       <TELL "I don't understand what you mean." CR>)
	      (T
	       <SETG HINTS-OFF T>
	       <TELL "[Hints have been disallowed for this session.]" CR>)>
	<RFATAL>>

<ROUTINE V-HINT ("AUX" CHR MAXC (C <>) Q (WHO <>))
  <COND (<==? ,HINTS-OFF -1>
	 <SETG HINTS-OFF 0>
	 <TELL
"[Warning: It is recognized that the temptation for help may at times be so
exceedingly strong that you might fetch hints prematurely. Therefore, you may
at any time during the story type HINTS OFF, and this will disallow the
seeking out of help for the present session of the story. If you still want a
hint now, indicate HINT.]" CR>
	 <RFATAL>)
	(,HINTS-OFF
	 <PERFORM ,V?HINTS-NO ,ROOMS>
	 <RFATAL>)>
  ;<IFSOUND <SETG SOUND-QUEUED? <>>
	   <KILL-SOUNDS>>
  <SET MAXC <GET ,HINTS 0>>
  <INIT-HINT-SCREEN>
  <CURSET 5 1>
  <PUT-UP-CHAPTERS>
  <SETG CUR-POS <- ,CHAPT-NUM 1>>
  <NEW-CURSOR>
  <REPEAT ()
	  <SET CHR <INPUT 1>>
	  <COND (<EQUAL? .CHR !\Q !\q>
		 <SET Q T>
		 <RETURN>)
		(<EQUAL? .CHR !\N !\n>
		 <ERASE-CURSOR>
		 <COND (<EQUAL? ,CHAPT-NUM .MAXC>
			<SETG CUR-POS 0>
			<SETG CHAPT-NUM 1>
			<SETG QUEST-NUM 1>)
		       (T
			<SETG CUR-POS <+ ,CUR-POS 1>>
			<SETG CHAPT-NUM <+ ,CHAPT-NUM 1>>
			<SETG QUEST-NUM 1>)>
		 <NEW-CURSOR>)
		(<EQUAL? .CHR !\P !\p>
		 <ERASE-CURSOR>
		 <COND (<EQUAL? ,CHAPT-NUM 1>
			<SETG CHAPT-NUM .MAXC>
			<SETG CUR-POS <- .MAXC 1>>)
		       (T
			<SETG CUR-POS <- ,CUR-POS 1>>
			<SETG CHAPT-NUM <- ,CHAPT-NUM 1>>)>
		 <SETG QUEST-NUM 1>
		 <NEW-CURSOR>)
		(<EQUAL? .CHR 13 10>
		 <PICK-QUESTION>
		 <RETURN>)>>
  <COND (<NOT .Q>
	 <AGAIN>	;"AGAIN does whole routine?")>
  <CLEAR -1>
  <INIT-STATUS-LINE>
  <TELL "Back to the story ..." CR>
  ;<IFSOUND <COND (,SOUND-ON?
		  <CHECK-LOOPING>)>>
  <RFATAL>>

<ROUTINE PICK-QUESTION ("AUX" CHR MAXQ (Q <>))
  <INIT-HINT-SCREEN <>>
  <LEFT-LINE 3 ,RETURN-SEE-HINT ,RETURN-SEE-HINT-LEN>
  <RIGHT-LINE 3 ,Q-MAIN-MENU ,Q-MAIN-MENU-LEN>
  <SET MAXQ <- <GET <GET ,HINTS ,CHAPT-NUM> 0> 1>>
  <CURSET 5 1>
  <PUT-UP-QUESTIONS>
  <SETG CUR-POS <- ,QUEST-NUM 1>>
  <NEW-CURSOR>
  <REPEAT ()
    <SET CHR <INPUT 1>>
    <COND (<EQUAL? .CHR !\Q !\q>
	   <SET Q T>
	   <RETURN>)
	  (<EQUAL? .CHR !\N !\n>
	   <ERASE-CURSOR>
	   <COND (<EQUAL? ,QUEST-NUM .MAXQ> ; "Wrap around on N"
		  <SETG CUR-POS 0>
		  <SETG QUEST-NUM 1>)
		 (T
		  <SETG CUR-POS <+ ,CUR-POS 1>>
		  <SETG QUEST-NUM <+ ,QUEST-NUM 1>>)>
	   <NEW-CURSOR>)
	  (<EQUAL? .CHR !\P !\p>
	   <ERASE-CURSOR>
	   <COND (<EQUAL? ,QUEST-NUM 1>
		  <SETG QUEST-NUM .MAXQ>
		  <SETG CUR-POS <- .MAXQ 1>>)
		 (T
		  <SETG CUR-POS <- ,CUR-POS 1>>
		  <SETG QUEST-NUM <- ,QUEST-NUM 1>>)>
	   <NEW-CURSOR>)
	  (<EQUAL? .CHR 13 10>
	   <DISPLAY-HINT>
	   <RETURN>)>>
  <COND (<NOT .Q>
	 <AGAIN>)>>

<ROUTINE ERASE-CURSOR ()
	<CURSET <GET ,LINE-TABLE ,CUR-POS>
		<- <GET ,COLUMN-TABLE ,CUR-POS> 2>>
	<TELL " ">	;"erase previous highlight cursor">

;"go back 2 spaces from question text, print cursor and flash is between
the cursor and text"

<ROUTINE NEW-CURSOR ()
	<CURSET <GET ,LINE-TABLE ,CUR-POS>
		<- <GET ,COLUMN-TABLE ,CUR-POS> 2 ;1>>
	<TELL ">">	;"print the new cursor">

<ROUTINE INVERSE-LINE ("AUX" (CENTER-HALF <>)) 
	<HLIGHT ,H-INVERSE>
	<PRINT-SPACES <LOWCORE SCRH>>
	<HLIGHT ,H-NORMAL>>

<ROUTINE DISPLAY-HINT ("AUX" H MX (CNT 2) CHR (FLG T) N CV
			  SHIFT? COUNT-OFFS)
  <CLEAR -1>
  <SPLIT 3>
  <SCREEN ,S-WINDOW>
  <CURSET 1 1>
  <INVERSE-LINE>
  <CENTER-LINE 1 ,INVISICLUES ,INVISICLUES-LEN>
  <CURSET 3 1>
  <INVERSE-LINE>
  <LEFT-LINE 3 "RETURN = see new hint">
  <RIGHT-LINE 3 ,Q-SEE-HINT-MENU ,Q-SEE-HINT-MENU-LEN>
  <CURSET 2 1>
  <INVERSE-LINE>
  <HLIGHT ,H-BOLD>
  <SET H <GET <GET ,HINTS ,CHAPT-NUM> <+ ,QUEST-NUM 1>>>
  ; "Byte table to use for showing questions already seen"
  ; "Actually a nibble table.  The high four bits of each byte are for
     quest-num odd; the low for bits are for quest-num even.  See SHIFT?
     and COUNT-OFFS."
  <SET CV <GET ,HINT-COUNTS <- ,CHAPT-NUM 1>>>
  <CENTER-LINE 2 <GET .H 1>>
  <HLIGHT ,H-NORMAL>
  <SET MX <GET .H 0>>
  <SCREEN ,S-TEXT>
  <CRLF>
  <SET SHIFT? <MOD ,QUEST-NUM 2>>
  <SET COUNT-OFFS </ <- ,QUEST-NUM 1> 2>>
  <REPEAT ((CURCX <GETB .CV .COUNT-OFFS>)
	   (CURC <+ 2 <ANDB <COND (.SHIFT? <LSH .CURCX -4>)
				  (T .CURCX)> *17*>>))
    <COND (<==? .CNT .CURC>
	   <RETURN>)
	  (T
	   <TELL <GET .H .CNT> CR>
	   <SET CNT <+ .CNT 1>>)>>
  <REPEAT ()
     <COND (<AND .FLG <G? .CNT .MX>>
	    <SET FLG <>>
	    <TELL "[That's all.]" CR>)
	   (.FLG
	    <SET N <+ <- .MX .CNT> 1>>
	    <TELL "[" N .N " hint">
	    <COND (<NOT <EQUAL? .N 1>>
		   <TELL "s">)>
	    <TELL " left.] -> ">
	    <SET FLG <>>)>
     <SET CHR <INPUT 1>>
     <COND (<EQUAL? .CHR !\Q !\q>
	    <COND (.SHIFT?
		   <PUTB .CV .COUNT-OFFS
			 <ORB <ANDB <GETB .CV .COUNT-OFFS> *17*>
			      <LSH <- .CNT 2> 4>>>)
		  (T
		   <PUTB .CV .COUNT-OFFS
			 <ORB <ANDB <GETB .CV .COUNT-OFFS> *360*>
			      <- .CNT 2>>>)>
	    <RETURN>)
	   (<EQUAL? .CHR 13 10>
	    <COND (<L=? .CNT .MX>
		   <SET FLG T>	;".cnt starts as 2"
		   <TELL <GET .H .CNT> CR>
		   ; "3rd = line 7, 4th = line 9, ect"
		   <COND (<G? <SET CNT <+ .CNT 1>> .MX>
			  <SET FLG <>>
			  <TELL "[Final hint]" CR>)>)>)>>>

<ROUTINE PUT-UP-QUESTIONS ("AUX" (ST 1) MXQ MXL)
  <SET MXQ <- <GET <GET ,HINTS ,CHAPT-NUM> 0> 1>>
  <SET MXL <- <LOWCORE SCRV> 1>>
  <REPEAT ()
	  <COND (<G? .ST .MXQ>
		 <RETURN>)
		(T                        ;"zeroth"
		 <CURSET <GET ,LINE-TABLE <- .ST 1>>
				<- <GET ,COLUMN-TABLE <- .ST 1>> 1>>)>
	  <TELL " " <GET <GET <GET ,HINTS ,CHAPT-NUM> <+ .ST 1>> 1>>
	  <SET ST <+ .ST 1>>>>

<ROUTINE PUT-UP-CHAPTERS ("AUX" (ST 1) MXC MXL)
  <SET MXC <GET ,HINTS 0>>
  <SET MXL <- <LOWCORE SCRV> 1>>
  <REPEAT ()
    <COND (<G? .ST .MXC>
	   <RETURN>)
	  (T                        ;"zeroth"
	   <CURSET
	    <GET ,LINE-TABLE <- .ST 1>>
	    <- <GET ,COLUMN-TABLE <- .ST 1>> 1>>)>
    <TELL " " <GET <GET ,HINTS .ST> 1>>
    <SET ST <+ .ST 1>>>>

<ROUTINE INIT-HINT-SCREEN ("OPTIONAL" (THIRD T))
  <CLEAR -1>
  <SPLIT <- <LOWCORE SCRV> 1>>
  <SCREEN ,S-WINDOW>
  <CURSET 1 1>
  <INVERSE-LINE>
  <CURSET 2 1>
  <INVERSE-LINE>
  <CURSET 3 1>
  <INVERSE-LINE>
  <CENTER-LINE 1 ,INVISICLUES ,INVISICLUES-LEN>
  <LEFT-LINE 2 " N = Next">
  <RIGHT-LINE 2 ,PREVIOUS ,PREVIOUS-LEN>
  <COND (.THIRD
	 <LEFT-LINE 3 " RETURN = See hint">
	 <RIGHT-LINE 3 ,Q-RESUME-STORY ,Q-RESUME-STORY-LEN>)>>

<ROUTINE CENTER-LINE (LN STR "OPTIONAL" (LEN 0) (INV T))
  <COND (<ZERO? .LEN>
	 <DIROUT ,D-TABLE-ON ,DIROUT-TBL>
	 <TELL .STR>
	 <DIROUT ,D-TABLE-OFF>
	 <SET LEN <GET ,DIROUT-TBL 0>>)>
  <CURSET .LN </ <- <LOWCORE SCRH> .LEN> 2>>
  <COND (.INV
	 <HLIGHT ,H-INVERSE>)>
  <TELL .STR>
  <COND (.INV
	 <HLIGHT ,H-NORMAL>)>>

<ROUTINE LEFT-LINE (LN STR "OPTIONAL" (INV T))
	<CURSET .LN 1>
	<COND (.INV
	       <HLIGHT ,H-INVERSE>)>
	<TELL .STR>
	<COND (.INV
	       <HLIGHT ,H-NORMAL>)>>

<ROUTINE RIGHT-LINE (LN STR "OPTIONAL" (LEN 0) (INV T))
	<COND (<ZERO? .LEN>
	       <DIROUT 3 ,DIROUT-TBL>
	       <TELL .STR>
	       <DIROUT -3>
	       <SET LEN <GET ,DIROUT-TBL 0>>)>
	<CURSET .LN <- <LOWCORE SCRH> .LEN>>
	<COND (.INV
	       <HLIGHT ,H-INVERSE>)>
	<TELL .STR>
	<COND (.INV
	       <HLIGHT ,H-NORMAL>)>>

