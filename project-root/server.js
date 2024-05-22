const express = require('express');
const path = require('path');
const app = express();
const port = 4000;

// Autoriser les requêtes CORS depuis toutes les origines
app.use((req, res, next) => {
    res.setHeader('Access-Control-Allow-Origin', '*');
    res.setHeader('Access-Control-Allow-Methods', 'GET, POST, OPTIONS, PUT, PATCH, DELETE');
    res.setHeader('Access-Control-Allow-Headers', 'X-Requested-With,content-type');
    next();
});

// Servir les fichiers statiques depuis le répertoire "public"
app.use(express.static(path.join(__dirname, 'public')));

// Données de musique (simulation)
const musicData = [
    {
      "id": "gazo_die01",
      "title": "DIE",
      "album": "KMT",
      "artist": "Gazo",
      "genre": "Rap",
      "photo": "https://i.scdn.co/image/ab6761610000e5ebbbbe37f0550a982d8519da6c",
      "source": "http://localhost:4000/music/gazo-die.mp3",
      "image": "https://i.scdn.co/image/ab67616d00001e02765b01901c10003211f8554d",
      "trackNumber": 1,
      "totalTrackCount": 1,
      "duration": 240,
      "site": "https://library.soundfield.com/track/55"
    },
    {
      "id": "gazo_saiyan02",
      "title": "Saiyan",
      "album": "Saiyan",
      "artist": "Gazo",
      "genre": "Rap",
      "photo": "https://i.scdn.co/image/ab6761610000e5ebbbbe37f0550a982d8519da6c",
      "source": "http://localhost:4000/music/gazo-saiyan.mp3",
      "image": "https://i.scdn.co/image/ab67616d0000b273a557147daf896f6c80b79d58",
      "trackNumber": 2,
      "totalTrackCount": 2,
      "duration": 189,
      "site": "https://library.soundfield.com/track/55"
    },
    {
      "id": "gazo_casanova03",
      "title": "Casanova",
      "album": "Casanova",
      "artist": "Gazo",
      "genre": "Rap",
      "photo": "https://i.scdn.co/image/ab6761610000e5ebbbbe37f0550a982d8519da6c",
      "source": "http://localhost:4000/music/gazo-casanova.mp3",
      "image": "https://i.scdn.co/image/ab67616d0000b2735e90edde8fea572f0400c369",
      "trackNumber": 3,
      "totalTrackCount": 3,
      "duration": 184,
      "site": "https://library.soundfield.com/track/55"
    },
    {
      "id": "gazo_flashback04",
      "title": "Flashback",
      "album": "IL LE FALLAIT",
      "artist": "Gazo",
      "genre": "Rap",
      "photo": "https://i.scdn.co/image/ab6761610000e5ebbbbe37f0550a982d8519da6c",
      "source": "http://localhost:4000/music/gazo-flashback.mp3",
      "image": "https://i.scdn.co/image/ab67616d0000b273bed20ca2a508148c3f8cffd8",
      "trackNumber": 4,
      "totalTrackCount": 4,
      "duration": 177,
      "site": "https://library.soundfield.com/track/55"
    },
    {
      "id": "rosalia_despecha01",
      "title": "Despecha",
      "album": "MOTOMAMI +",
      "artist": "Rosalia",
      "genre": "Latino",
      "photo": "https://i.scdn.co/image/ab67616d0000b2738f072024e0358fc5c62eba41",
      "source": "http://localhost:4000/music/rosalia-despecha.mp3",
      "image": "https://i.scdn.co/image/ab67616d0000b2738f072024e0358fc5c62eba41",
      "trackNumber": 1,
      "totalTrackCount": 5,
      "duration": 157,
      "site": "https://library.soundfield.com/track/55"
    },
    {
      "id": "rosalia_bizcochito02",
      "title": "Bizcochito",
      "album": "MOTOMAMI",
      "artist": "Rosalia",
      "genre": "Latino",
      "photo": "https://i.scdn.co/image/ab67616d0000b2738f072024e0358fc5c62eba41",
      "source": "http://localhost:4000/music/rosalia-bizcochito.mp3", 
      "image": "https://i.scdn.co/image/ab67616d0000b2730c179967a265de0fc76382fe",
      "trackNumber": 2,
      "totalTrackCount": 6,
      "duration": 108,
      "site": "https://library.soundfield.com/track/55"
    },
    {
      "id": "rosalia_lafama03",
      "title": "LA FAMA",
      "album": "MOTOMAMI",
      "artist": "Rosalia",
      "genre": "Latino",
      "photo": "https://i.scdn.co/image/ab67616d0000b2738f072024e0358fc5c62eba41",
      "source": "http://localhost:4000/music/rosalia-lafama.mp3", 
      "image": "https://i.scdn.co/image/ab67616d0000b2730c179967a265de0fc76382fe",
      "trackNumber": 2,
      "totalTrackCount": 7,
      "duration": 187,
      "site": "https://library.soundfield.com/track/55"
    },
    {
      "id": "rosalia_yoxtituxmi04",
      "title": "Yo x Ti, Tu x Mi",
      "album": "YO x TI, TU x MI",
      "artist": "Rosalia",
      "genre": "Latino",
      "photo": "https://i.scdn.co/image/ab67616d0000b2738f072024e0358fc5c62eba41",
      "source": "http://localhost:4000/music/rosalia-yoxtituxmi.mp3",
      "image": "https://i.scdn.co/image/ab67616d0000b273694844fd046ab81e5dc9a4cf",
      "trackNumber": 2,
      "totalTrackCount": 8,
      "duration": 196,
      "site": "https://library.soundfield.com/track/55"
    },
    {
      "id": "theweeknd_blindinglights01",
      "title": "Blinding Lights",
      "album": "After Hours",
      "artist": "The Weeknd",
      "genre": "Pop",
      "photo": "https://i.scdn.co/image/ab6761610000e5eb214f3cf1cbe7139c1e26ffbb",
      "source": "http://localhost:4000/music/theweeknd-blindinglights.mp3",
      "image": "https://i.scdn.co/image/ab67616d0000b273a3eff72f62782fb589a492f9",
      "trackNumber": 1,
      "totalTrackCount": 9,
      "duration": 199,
      "site": "https://images.squarespace-cdn.com/content/v1/5e4d521a3d1e463a28d50504/1605302912205-J9KVVF35Z032MVCZ7KTP/IMG_2462.JPG"
    },
    {
      "id": "theweeknd_starboy02",
      "title": "Starboy",
      "album": "Starboy",
      "artist": "The Weeknd",
      "genre": "Pop",
      "photo": "https://i.scdn.co/image/ab6761610000e5eb214f3cf1cbe7139c1e26ffbb",
      "source": "http://localhost:4000/music/theweeknd-starboy.mp3",
      "image": "https://i.scdn.co/image/ab67616d0000b2734718e2b124f79258be7bc452",
      "trackNumber": 2,
      "totalTrackCount": 10,
      "duration": 227,
      "site": "https://images.squarespace-cdn.com/content/v1/5e4d521a3d1e463a28d50504/1605302912205-J9KVVF35Z032MVCZ7KTP/IMG_2462.JPG"
    },
    {
      "id": "theweeknd_inyoureyes03",
      "title": "In Your Eyes",
      "album": "After Hours",
      "artist": "The Weeknd",
      "genre": "Pop",
      "photo": "https://i.scdn.co/image/ab6761610000e5eb214f3cf1cbe7139c1e26ffbb",
      "source": "http://localhost:4000/music/theweeknd-inyoureyes.mp3",
      "image": "https://i.scdn.co/image/ab67616d0000b273a3eff72f62782fb589a492f9",
      "trackNumber": 3,
      "totalTrackCount": 11,
      "duration": 237,
      "site": "https://images.squarespace-cdn.com/content/v1/5e4d521a3d1e463a28d50504/1605302912205-J9KVVF35Z032MVCZ7KTP/IMG_2462.JPG"
    },
    {
      "id": "theweeknd_saveyourtears04",
      "title": "Save Your Tears",
      "album": "After Hours",
      "artist": "The Weeknd",
      "genre": "Pop",
      "photo": "https://i.scdn.co/image/ab6761610000e5eb214f3cf1cbe7139c1e26ffbb",
      "source": "http://localhost:4000/music/theweeknd-saveyourtears.mp3",
      "image": "https://i.scdn.co/image/ab67616d0000b273a3eff72f62782fb589a492f9",
      "trackNumber": 4,
      "totalTrackCount": 12,
      "duration": 216,
      "site": "https://images.squarespace-cdn.com/content/v1/5e4d521a3d1e463a28d50504/1605302912205-J9KVVF35Z032MVCZ7KTP/IMG_2462.JPG"
    },
    {
      "id": "davidguetta-imgood01",
      "title": "I'm Good",
      "album": "7",
      "artist": "David Guetta",
      "genre": "Electro/Dance",
      "photo": "https://i.scdn.co/image/ab6761610000e5ebf150017ca69c8793503c2d4f",
      "source": "http://localhost:4000/music/davidguetta-imgood.mp3",
      "image": "https://i.scdn.co/image/ab67616d0000b273933c036cd61cd40d3f17a9c4",
      "trackNumber": 1,
      "totalTrackCount": 13,
      "duration": 176,
      "site": "https://library.soundfield.com/track/55"
    },
    {
      "id": "davidguetta-memories02",
      "title": "Memories",
      "album": "Memories",
      "artist": "David Guetta",
      "genre": "Electro/Dance",
      "photo": "https://i.scdn.co/image/ab6761610000e5ebf150017ca69c8793503c2d4f",
      "source": "http://localhost:4000/music/davidguetta-memories.mp3",
      "image": "https://i.scdn.co/image/ab67616d0000b273652d7edf3b2df82853f0339b",
      "trackNumber": 2,
      "totalTrackCount": 14,
      "duration": 209,
      "site": "https://library.soundfield.com/track/55"
    },
    {
      "id": "davidguetta-titanium03",
      "title": "Titanium",
      "album": "Nothing But The Beat",
      "artist": "David Guetta",
      "genre": "Electro/Dance",
      "photo": "https://i.scdn.co/image/ab6761610000e5ebf150017ca69c8793503c2d4f",
      "source": "http://localhost:4000/music/davidguetta-titanium.mp3",
      "image": "https://i.scdn.co/image/ab67616d0000b27354e095b51d4ba95496cd60d7",
      "trackNumber": 3,
      "totalTrackCount": 15,
      "duration": 235,
      "site": "https://library.soundfield.com/track/55"
    },
    {
      "id": "davidguetta-sexybitch04",
      "title": "Sexy Bitch",
      "album": "One More Love",
      "artist": "David Guetta",
      "genre": "Electro/Dance",
      "photo": "https://i.scdn.co/image/ab6761610000e5ebf150017ca69c8793503c2d4f",
      "source": "http://localhost:4000/music/davidguetta-sexybitch.mp3",
      "image": "https://i.scdn.co/image/ab67616d0000b273f45c50e7cff5f2376c1e36ea",
      "trackNumber": 4,
      "totalTrackCount": 16,
      "duration": 192,
      "site": "https://library.soundfield.com/track/55"
    },
    {
      "id": "drake-onedance01",
      "title": "One Dance",
      "album": "Views",
      "artist": "Drake",
      "genre": "Hip-Hop",
      "photo": "https://i.scdn.co/image/ab6761610000e5eb4293385d324db8558179afd9",
      "source": "http://localhost:4000/music/drake-onedance.mp3",
      "image": "https://i.scdn.co/image/ab67616d0000b273726abca207567d5e41cb9667",
      "trackNumber": 1,
      "totalTrackCount": 17,
      "duration": 174,
      "site": "https://library.soundfield.com/track/55"
    },
    {
      "id": "drake-godsplan02",
      "title": "God's Plan",
      "album": "Scorpion",
      "artist": "Drake",
      "genre": "Hip-Hop",
      "photo": "https://i.scdn.co/image/ab6761610000e5eb4293385d324db8558179afd9",
      "source": "http://localhost:4000/music/drake-godsplan.mp3",
      "image": "https://i.scdn.co/image/ab67616d0000b273f907de96b9a4fbc04accc0d5",
      "trackNumber": 2,
      "totalTrackCount": 18,
      "duration": 199,
      "site": "https://library.soundfield.com/track/55"
    },
    {
      "id": "drake-hotlinebling03",
      "title": "Hotline Bling",
      "album": "Hotline Bling",
      "artist": "Drake",
      "genre": "Hip-Hop",
      "photo": "https://i.scdn.co/image/ab6761610000e5eb4293385d324db8558179afd9",
      "source": "http://localhost:4000/music/drake-hotlinebling.mp3",
      "image": "https://i.scdn.co/image/ab67616d0000b27382469169af5a8750168581ae",
      "trackNumber": 3,
      "totalTrackCount": 19,
      "duration": 222,
      "site": "https://library.soundfield.com/track/55"
    },
    {
      "id": "drake-nonstop04",
      "title": "Nonstop",
      "album": "Scorpion",
      "artist": "Drake",
      "genre": "Hip-Hop",
      "photo": "https://i.scdn.co/image/ab6761610000e5eb4293385d324db8558179afd9",
      "source": "http://localhost:4000/music/drake-nonstop.mp3",
      "image": "https://i.scdn.co/image/ab67616d0000b273f907de96b9a4fbc04accc0d5",
      "trackNumber": 4,
      "totalTrackCount": 20,
      "duration": 272,
      "site": "https://library.soundfield.com/track/55"
    },
    {
      "id": "bts-dynamite01",
      "title": "Dynamite",
      "album": "Dynamite",
      "artist": "BTS",
      "genre": "K-Pop",
      "photo": "https://i.scdn.co/image/ab67616100005174d642648235ebf3460d2d1f6a",
      "source": "http://localhost:4000/music/bts-dynamite.mp3",
      "image": "https://i.scdn.co/image/ab67616d00001e022f86d9710377e63bfbc82ba8",
      "trackNumber": 1,
      "totalTrackCount": 21,
      "duration": 198,
      "site": "https://library.soundfield.com/track/55"
    },
    {
      "id": "bts-myuniverse02",
      "title": "My Universe",
      "album": "My Universe",
      "artist": "BTS",
      "genre": "K-Pop",
      "photo": "https://i.scdn.co/image/ab67616100005174d642648235ebf3460d2d1f6a",
      "source": "http://localhost:4000/music/bts-myuniverse.mp3",
      "image": "https://i.scdn.co/image/ab67616d0000b273f60a9b7e2abafc38da31f575",
      "trackNumber": 2,
      "totalTrackCount": 22,
      "duration": 228,
      "site": "https://library.soundfield.com/track/55"
    },
    {
      "id": "bts-butter03",
      "title": "Butter",
      "album": "Butter",
      "artist": "BTS",
      "genre": "K-Pop",
      "photo": "https://i.scdn.co/image/ab67616100005174d642648235ebf3460d2d1f6a",
      "source": "http://localhost:4000/music/bts-butter.mp3",
      "image": "https://i.scdn.co/image/ab67616d0000b273240447f2da1433d8f4303596",
      "trackNumber": 3,
      "totalTrackCount": 23,
      "duration": 166,
      "site": "https://library.soundfield.com/track/55"
    },
    {
      "id": "bts-leftandright04",
      "title": "Left & Right",
      "album": "Left & Right",
      "artist": "BTS",
      "genre": "K-Pop",
      "photo": "https://i.scdn.co/image/ab67616100005174d642648235ebf3460d2d1f6a",
      "source": "http://localhost:4000/music/bts-leftandright.mp3",
      "image": "https://i.scdn.co/image/ab67616d0000b273a4a50278c195966548e3a7c0",
      "trackNumber": 4,
      "totalTrackCount": 24,
      "duration": 153,
      "site": "https://library.soundfield.com/track/55"
    },
    {
      "id": "plk_emotif01",
      "title": "Emotif",
      "album": "Enna",
      "artist": "PLK",
      "genre": "Rap",
      "photo": "https://i.scdn.co/image/ab6761610000e5eb7807ff8b003a33822c40d28c",
      "source": "http://localhost:4000/music/plk-emotif.mp3",
      "image": "https://i.scdn.co/image/ab67616d0000b273ab779f2adb1007f0321ecab8",
      "trackNumber": 1,
      "totalTrackCount": 25,
      "duration": 161,
      "site": "https://library.soundfield.com/track/55"
    },
    {
      "id": "plk_çamèneàrien02",
      "title": "Ça mène à rien",
      "album": "Chambre 140",
      "artist": "PLK",
      "genre": "Rap",
      "photo": "https://i.scdn.co/image/ab6761610000e5eb7807ff8b003a33822c40d28c",
      "source": "http://localhost:4000/music/plk-camenearien.mp3",
      "image": "https://i.scdn.co/image/ab67616d0000b2735f47f03829e4df052424712c",
      "trackNumber": 2,
      "totalTrackCount": 26,
      "duration": 198,
      "site": "https://library.soundfield.com/track/55"
    },
    {
      "id": "plk_nouvelles03",
      "title": "Nouvelles",
      "album": "2069'",
      "artist": "PLK",
      "genre": "Rap",
      "photo": "https://i.scdn.co/image/ab6761610000e5eb7807ff8b003a33822c40d28c",
      "source": "http://localhost:4000/music/plk-nouvelles.mp3",
      "image": "https://i.scdn.co/image/ab67616d0000b273390bfa914f9f7b04582aba5d",
      "trackNumber": 3,
      "totalTrackCount": 27,
      "duration": 177,
      "site": "https://library.soundfield.com/track/55"
    },
    {
      "id": "plk_unpeudehaine04",
      "title": "Un peu de haine",
      "album": "Mental",
      "artist": "PLK",
      "genre": "Rap",
      "photo": "https://i.scdn.co/image/ab6761610000e5eb7807ff8b003a33822c40d28c",
      "source": "http://localhost:4000/music/plk-unpeudehaine.mp3",
      "image": "https://i.scdn.co/image/ab67616d0000b273fb231919866fc73ec12d145f",
      "trackNumber": 4,
      "totalTrackCount": 28,
      "duration": 174,
      "site": "https://library.soundfield.com/track/55"
    },
    {
      "id": "dualipa_onekiss01",
      "title": "One Kiss",
      "album": "One Kiss",
      "artist": "Dua Lipa",
      "genre": "Pop",
      "photo": "https://i.scdn.co/image/ab67616d0000b2732172b607853fa89cefa2beb4",
      "source": "http://localhost:4000/music/dualipa-onekiss.mp3",
      "image": "https://i.scdn.co/image/ab67616d0000b273d09f96d82310d4d77c14c108",
      "trackNumber": 1,
      "totalTrackCount": 29,
      "duration": 211,
      "site": "https://images.squarespace-cdn.com/content/v1/5e4d521a3d1e463a28d50504/1605302912205-J9KVVF35Z032MVCZ7KTP/IMG_2462.JPG"
    },
    {
      "id": "dualipa_levitating02",
      "title": "Levitating",
      "album": "Future Nostalgia",
      "artist": "Dua Lipa",
      "genre": "Pop",
      "photo": "https://i.scdn.co/image/ab67616d0000b2732172b607853fa89cefa2beb4",
      "source": "http://localhost:4000/music/dualipa-levitating.mp3",
      "image": "https://i.scdn.co/image/ab67616d0000b273ccdddb2e5349ea0608c3e016",
      "trackNumber": 2,
      "totalTrackCount": 30,
      "duration": 207,
      "site": "https://images.squarespace-cdn.com/content/v1/5e4d521a3d1e463a28d50504/1605302912205-J9KVVF35Z032MVCZ7KTP/IMG_2462.JPG"
    },
    {
      "id": "dualipa_dancethenight03",
      "title": "Dance The Night",
      "album": "Dance The Night",
      "artist": "Dua Lipa",
      "genre": "Pop",
      "photo": "https://i.scdn.co/image/ab67616d0000b2732172b607853fa89cefa2beb4",
      "source": "http://localhost:4000/music/dualipa-dancethenight.mp3",
      "image": "https://i.scdn.co/image/ab67616d0000b2737dd3ba455ee3390cb55b0192",
      "trackNumber": 3,
      "totalTrackCount": 31,
      "duration": 173,
      "site": "https://images.squarespace-cdn.com/content/v1/5e4d521a3d1e463a28d50504/1605302912205-J9KVVF35Z032MVCZ7KTP/IMG_2462.JPG"
    },
    {
      "id": "dualipa_newrules04",
      "title": "New Rules",
      "album": "Dua Lipa",
      "artist": "Dua Lipa",
      "genre": "Pop",
      "photo": "https://i.scdn.co/image/ab67616d0000b2732172b607853fa89cefa2beb4",
      "source": "http://localhost:4000/music/dualipa-newrules.mp3",
      "image": "https://i.scdn.co/image/ab67616d00001e02838698485511bd9108fadadc",
      "trackNumber": 4,
      "totalTrackCount": 32,
      "duration": 209,
      "site": "https://images.squarespace-cdn.com/content/v1/5e4d521a3d1e463a28d50504/1605302912205-J9KVVF35Z032MVCZ7KTP/IMG_2462.JPG"
    },
    {
      "id": "djsnake_leanon01",
      "title": "Lean On",
      "album": "Peace Is The Mission",
      "artist": "DJ Snake",
      "genre": "Electro/Dance",
      "photo": "https://i.scdn.co/image/ab6775700000ee855aa07053dfecc2cd1e45a6bf",
      "source": "http://localhost:4000/music/djsnake-leanon.mp3",
      "image": "https://i.scdn.co/image/ab67616d0000b273d6d24aee7b49a2db98a76856",
      "trackNumber": 1,
      "totalTrackCount": 33,
      "duration": 176,
      "site": "https://library.soundfield.com/track/55"
    },
    {
      "id": "djsnake_lococontigo02",
      "title": "Loco Contigo",
      "album": "Carte Blanche",
      "artist": "DJ Snake",
      "genre": "Electro/Dance",
      "photo": "https://i.scdn.co/image/ab6775700000ee855aa07053dfecc2cd1e45a6bf",
      "source": "http://localhost:4000/music/djsnake-lococontigo.mp3",
      "image": "https://i.scdn.co/image/ab67616d0000b273caf82abb2338880577e472be",
      "trackNumber": 2,
      "totalTrackCount": 34,
      "duration": 185,
      "site": "https://library.soundfield.com/track/55"
    },
    {
      "id": "djsnake_sg03",
      "title": "SG",
      "album": "SG",
      "artist": "DJ Snake",
      "genre": "Electro/Dance",
      "photo": "https://i.scdn.co/image/ab6775700000ee855aa07053dfecc2cd1e45a6bf",
      "source": "http://localhost:4000/music/djsnake-sg.mp3",
      "image": "https://i.scdn.co/image/ab67616d0000b27354d075797911e02360beb3e7",
      "trackNumber": 3,
      "totalTrackCount": 35,
      "duration": 225,
      "site": "https://library.soundfield.com/track/55"
    },
    {
      "id": "djsnake_turndownforwhat04",
      "title": "Turn Down For What",
      "album": "Turn Down For What",
      "artist": "DJ Snake",
      "genre": "Electro/Dance",
      "photo": "https://i.scdn.co/image/ab6775700000ee855aa07053dfecc2cd1e45a6bf",
      "source": "http://localhost:4000/music/djsnake-turndownforwhat.mp3",
      "image": "https://i.scdn.co/image/ab67616d0000b273d905e78cad304de028db39b7",
      "trackNumber": 4,
      "totalTrackCount": 36,
      "duration": 213,
      "site": "https://library.soundfield.com/track/55"
    },
    {
      "id": "eminem_withoutme01",
      "title": "Without Me",
      "album": "The Eminem Show",
      "artist": "Eminem",
      "genre": "Hip-Hop",
      "photo": "https://i.scdn.co/image/ab6761610000e5eba00b11c129b27a88fc72f36b",
      "source": "http://localhost:4000/music/eminem-withoutme.mp3",
      "image": "https://i.scdn.co/image/ab67616d0000b2736ca5c90113b30c3c43ffb8f4",
      "trackNumber": 1,
      "totalTrackCount": 37,
      "duration": 291,
      "site": "https://library.soundfield.com/track/55"
    },
    {
      "id": "eminem_mockingbird02",
      "title": "Mockingbird",
      "album": "Encore",
      "artist": "Eminem",
      "genre": "Hip-Hop",
      "photo": "https://i.scdn.co/image/ab6761610000e5eba00b11c129b27a88fc72f36b",
      "source": "http://localhost:4000/music/eminem-mockingbird.mp3",
      "image": "https://i.scdn.co/image/ab67616d00001e02726d48d93d02e1271774f023",
      "trackNumber": 2,
      "totalTrackCount": 38,
      "duration": 285,
      "site": "https://library.soundfield.com/track/55"
    },
    {
      "id": "eminem_therealslimshady03",
      "title": "The Real Slim Shady",
      "album": "The Marshall Mathers LP",
      "artist": "Eminem",
      "genre": "Hip-Hop",
      "photo": "https://i.scdn.co/image/ab6761610000e5eba00b11c129b27a88fc72f36b",
      "source": "http://localhost:4000/music/eminem-therealslimshady.mp3",
      "image": "https://i.scdn.co/image/ab67616d0000b273dbb3dd82da45b7d7f31b1b42",
      "trackNumber": 3,
      "totalTrackCount": 39,
      "duration": 284,
      "site": "https://library.soundfield.com/track/55"
    },
    {
      "id": "eminem_loseyourself04",
      "title": "Lose Yourself",
      "album": "Just Lose It",
      "artist": "Eminem",
      "genre": "Hip-Hop",
      "photo": "https://i.scdn.co/image/ab6761610000e5eba00b11c129b27a88fc72f36b",
      "source": "http://localhost:4000/music/eminem-loseyourself.mp3",
      "image": "https://i.scdn.co/image/ab67616d0000b273dd43b3d65ed35a0d6436582a",
      "trackNumber": 4,
      "totalTrackCount": 40,
      "duration": 320,
      "site": "https://library.soundfield.com/track/55"
    },
    {
      "id": "badbunny_monaco01",
      "title": "MONACO",
      "album": "EL ÚLTIMO TOUR",
      "artist": "Bad Bunny",
      "genre": "Latino",
      "photo": "https://i.scdn.co/image/ab6761610000e5eb9ad50e478a469448c6f369df",
      "source": "http://localhost:4000/music/badbunny-monaco.mp3",
      "image": "https://i.scdn.co/image/ab67616d0000b2737b1fc51ff3257b5286a1ecec",
      "trackNumber": 1,
      "totalTrackCount": 41,
      "duration": 267,
      "site": "https://library.soundfield.com/track/55"
    },
    {
      "id": "badbunny_dakiti02",
      "title": "DAKITI",
      "album": "DAKITI",
      "artist": "Bad Bunny",
      "genre": "Latino",
      "photo": "https://i.scdn.co/image/ab6761610000e5eb9ad50e478a469448c6f369df",
      "source": "http://localhost:4000/music/badbunny-dakiti.mp3", 
      "image": "https://i.scdn.co/image/ab67616d0000b27334c8199b0b3b3fb42b8a98a8",
      "trackNumber": 2,
      "totalTrackCount": 42,
      "duration": 206,
      "site": "https://library.soundfield.com/track/55"
    },
    {
      "id": "badbunny_chambea03",
      "title": "Chambea",
      "album": "Chambea",
      "artist": "Bad Bunny",
      "genre": "Latino",
      "photo": "https://i.scdn.co/image/ab6761610000e5eb9ad50e478a469448c6f369df",
      "source": "http://localhost:4000/music/badbunny-chambea.mp3", 
      "image": "https://i.scdn.co/image/ab67616d0000b273147689b8550e68c0e6f78411",
      "trackNumber": 3,
      "totalTrackCount": 43,
      "duration": 187,
      "site": "https://library.soundfield.com/track/55"
    },
    {
      "id": "badbunny_bookert04",
      "title": "Booker T",
      "album": "EL ÚLTIMO TOUR",
      "artist": "Bad Bunny",
      "genre": "Latino",
      "photo": "https://i.scdn.co/image/ab6761610000e5eb9ad50e478a469448c6f369df",
      "source": "http://localhost:4000/music/badbunny-bookert.mp3",
      "image": "https://i.scdn.co/image/ab67616d0000b273005ee342f4eef2cc6e8436ab",
      "trackNumber": 4,
      "totalTrackCount": 44,
      "duration": 166,
      "site": "https://library.soundfield.com/track/55"
    },
    {
      "id": "psy_gangnamstyle01",
      "title": "Gangnam Style",
      "album": "Gangnam Style",
      "artist": "PSY",
      "genre": "K-Pop",
      "photo": "https://i.scdn.co/image/ab6761610000e5eb24b5185226d5b7c6aa91db5a",
      "source": "http://localhost:4000/music/psy-gangnamstyle.mp3",
      "image": "https://i.scdn.co/image/ab67616d0000b2736cfc57e5358c5e39e79bccbd",
      "trackNumber": 1,
      "totalTrackCount": 45,
      "duration": 219,
      "site": "https://library.soundfield.com/track/55"
    },
    {
      "id": "psy_gentleman02",
      "title": "Gentleman",
      "album": "Gentleman",
      "artist": "PSY",
      "genre": "K-Pop",
      "photo": "https://i.scdn.co/image/ab6761610000e5eb24b5185226d5b7c6aa91db5a",
      "source": "http://localhost:4000/music/psy-gentleman.mp3",
      "image": "https://i.scdn.co/image/ab67616d0000b273dbba4b73b9ff44415c8d05a2",
      "trackNumber": 2,
      "totalTrackCount": 46,
      "duration": 200,
      "site": "https://library.soundfield.com/track/55"
    },
    {
      "id": "psy_daddy03",
      "title": "Daddy",
      "album": "Chiljip PSY-Da",
      "artist": "PSY",
      "genre": "K-Pop",
      "photo": "https://i.scdn.co/image/ab6761610000e5eb24b5185226d5b7c6aa91db5a",
      "source": "http://localhost:4000/music/psy-daddy.mp3",
      "image": "https://i.scdn.co/image/ab67616d0000b27354ad68ff7528e45d3df49759",
      "trackNumber": 3,
      "totalTrackCount": 47,
      "duration": 230,
      "site": "https://library.soundfield.com/track/55"
    },
    {
      "id": "psy_thatthatlyrics04",
      "title": "That That Lyrics",
      "album": "Chiljip PSY-Da",
      "artist": "PSY",
      "genre": "K-Pop",
      "photo": "https://i.scdn.co/image/ab6761610000e5eb24b5185226d5b7c6aa91db5a",
      "source": "http://localhost:4000/music/psy-thatthatlyrics.mp3",
      "image": "https://i.scdn.co/image/ab67616d0000b27354ad68ff7528e45d3df49759",
      "trackNumber": 4,
      "totalTrackCount": 48,
      "duration": 173,
      "site": "https://library.soundfield.com/track/55"
    },
    {
      "id": "acdc_highwaytohell01",
      "title": "Highway To Hell",
      "album": "Highway To Hell",
      "artist": "AC/DC",
      "genre": "Rock",
      "photo": "https://i.scdn.co/image/ab6761610000e5ebc4c77549095c86acb4e77b37",
      "source": "http://localhost:4000/music/acdc-highwaytohell.mp3",
      "image": "https://i.scdn.co/image/ab67616d0000b27351c02a77d09dfcd53c8676d0",
      "trackNumber": 1,
      "totalTrackCount": 49,
      "duration": 210,
      "site": "https://library.soundfield.com/track/55"
    },
    {
      "id": "acdc_backinblack02",
      "title": "Back In Black",
      "album": "Back In Black",
      "artist": "AC/DC",
      "genre": "Rock",
      "photo": "https://i.scdn.co/image/ab6761610000e5ebc4c77549095c86acb4e77b37",
      "source": "http://localhost:4000/music/acdc-backinblack.mp3",
      "image": "https://i.scdn.co/image/ab67616d0000b2730b51f8d91f3a21e8426361ae",
      "trackNumber": 2,
      "totalTrackCount": 50,
      "duration": 253,
      "site": "https://library.soundfield.com/track/55"
    },
    {
      "id": "acdc_thunderstruck03",
      "title": "Thunderstruck",
      "album": "The Razors Edge",
      "artist": "AC/DC",
      "genre": "Rock",
      "photo": "https://i.scdn.co/image/ab6761610000e5ebc4c77549095c86acb4e77b37",
      "source": "http://localhost:4000/music/acdc-thunderstruck.mp3",
      "image": "https://i.scdn.co/image/ab67616d0000b2738399047ff71200928f5b6508",
      "trackNumber": 3,
      "totalTrackCount": 51,
      "duration": 293,
      "site": "https://library.soundfield.com/track/55"
    },
    {
      "id": "acdc_youshookmeallnightlong04",
      "title": "You Shook Me All Night",
      "album": "Back In Black",
      "artist": "AC/DC",
      "genre": "Rock",
      "photo": "https://i.scdn.co/image/ab6761610000e5ebc4c77549095c86acb4e77b37",
      "source": "http://localhost:4000/music/acdc-youshookmeallnightlong.mp3",
      "image": "https://i.scdn.co/image/ab67616d0000b2730b51f8d91f3a21e8426361ae",
      "trackNumber": 4,
      "totalTrackCount": 52,
      "duration": 210,
      "site": "https://library.soundfield.com/track/55"
    },
    {
      "id": "queen_bohemianrhapsody01",
      "title": "Bohemian Rhapsody",
      "album": "A Night At The Opera",
      "artist": "Queen",
      "genre": "Rock",
      "photo": "https://i.scdn.co/image/af2b8e57f6d7b5d43a616bd1e27ba552cd8bfd42",
      "source": "http://localhost:4000/music/queen-bohemianrhapsody.mp3",
      "image": "https://i.scdn.co/image/ab67616d0000b2733025a441495664948b809537",
      "trackNumber": 1,
      "totalTrackCount": 53,
      "duration": 362,
      "site": "https://library.soundfield.com/track/55"
    },
    {
      "id": "queen_wearethechampions02",
      "title": "We Are The Champions",
      "album": "News Of The World",
      "artist": "Queen",
      "genre": "Rock",
      "photo": "https://i.scdn.co/image/af2b8e57f6d7b5d43a616bd1e27ba552cd8bfd42",
      "source": "http://localhost:4000/music/queen-wearethechampions.mp3",
      "image": "https://i.scdn.co/image/ab67616d0000b27334389fa8db3892cd63eb323c",
      "trackNumber": 2,
      "totalTrackCount": 54,
      "duration": 184,
      "site": "https://library.soundfield.com/track/55"
    },
    {
      "id": "queen-wewillrockyou03",
      "title": "We Will Rock You",
      "album": "News Of The World",
      "artist": "Queen",
      "genre": "Rock",
      "photo": "https://i.scdn.co/image/af2b8e57f6d7b5d43a616bd1e27ba552cd8bfd42",
      "source": "http://localhost:4000/music/queen-wewillrockyou.mp3",
      "image": "https://i.scdn.co/image/ab67616d0000b27334389fa8db3892cd63eb323c",
      "trackNumber": 3,
      "totalTrackCount": 55,
      "duration": 122,
      "site": "https://library.soundfield.com/track/55"
    },
    {
      "id": "queen_donstopmenow04",
      "title": "Don't Stop Me Now",
      "album": "Jazz",
      "artist": "Queen",
      "genre": "Rock",
      "photo": "https://i.scdn.co/image/af2b8e57f6d7b5d43a616bd1e27ba552cd8bfd42",
      "source": "http://localhost:4000/music/queen-dontstopmenow.mp3",
      "image": "https://i.scdn.co/image/ab67616d0000b2730b7c95b538308aebf58cc4f6",
      "trackNumber": 4,
      "totalTrackCount": 56,
      "duration": 222,
      "site": "https://library.soundfield.com/track/55"
    },
    {
      "id": "indochine_laventurier01",
      "title": "L'Aventurier",
      "album": "L'Aventurier",
      "artist": "Indochine",
      "genre": "French variety",
      "photo": "https://i.scdn.co/image/ab6761610000e5ebfd39ed4c2d6f08028cc1ce3c",
      "source": "http://localhost:4000/music/indochine-laventurier.mp3",
      "image": "https://i.scdn.co/image/ab67616d0000b273f80fe67d0f4293be5b8f5251",
      "trackNumber": 1,
      "totalTrackCount": 57,
      "duration": 234,
      "site": "https://library.soundfield.com/track/55"
    },
    {
      "id": "indochine_3nuitsparsemaine02",
      "title": "Trois Nuits Par Semaine",
      "album": "3",
      "artist": "Indochine",
      "genre": "French variety",
      "photo": "https://i.scdn.co/image/ab6761610000e5ebfd39ed4c2d6f08028cc1ce3c",
      "source": "http://localhost:4000/music/indochine-troisnuitsparsemaine.mp3",
      "image": "https://i.scdn.co/image/ab67616d0000b2737e0eff6f9a10fe75705c2174",
      "trackNumber": 2,
      "totalTrackCount": 58,
      "duration": 290,
      "site": "https://library.soundfield.com/track/55"
    },
    {
      "id": "indochine_jaidemandealalune03",
      "title": "J'ai Demandé à la Lune",
      "album": "Paradize",
      "artist": "Indochine",
      "genre": "French variety",
      "photo": "https://i.scdn.co/image/ab6761610000e5ebfd39ed4c2d6f08028cc1ce3c",
      "source": "http://localhost:4000/music/indochine-jaidemandealalune.mp3",
      "image": "https://i.scdn.co/image/ab67616d0000b2733975dbc854bab72a10274397",
      "trackNumber": 3,
      "totalTrackCount": 59,
      "duration": 208,
      "site": "https://library.soundfield.com/track/55"
    },
    {
      "id": "indochine_canarybay04",
      "title": "Canary Bay",
      "album": "3",
      "artist": "Indochine",
      "genre": "French variety",
      "photo": "https://i.scdn.co/image/ab6761610000e5ebfd39ed4c2d6f08028cc1ce3c",
      "source": "http://localhost:4000/music/indochine-canarybay.mp3",
      "image": "https://i.scdn.co/image/ab67616d0000b2737e0eff6f9a10fe75705c2174",
      "trackNumber": 4,
      "totalTrackCount": 60,
      "duration": 323,
      "site": "https://library.soundfield.com/track/55"
    },
    {
      "id": "jjg_quandlamusiqueestbonne01",
      "title": "La Musique Est Bonne",
      "album": "Traces",
      "artist": "Jean-Jacques Goldman",
      "genre": "French variety",
      "photo": "https://i.scdn.co/image/ab6761610000e5eb5b0234933d862408792e19a3",
      "source": "http://localhost:4000/music/jjg-quandlamusiqueestbonne.mp3",
      "image": "https://i.scdn.co/image/ab67616d0000b273cace770a408227c4d135203d",
      "trackNumber": 1,
      "totalTrackCount": 61,
      "duration": 225,
      "site": "https://library.soundfield.com/track/55"
    },
    {
      "id": "jjg_jetedonne02",
      "title": "Je Te Donne",
      "album": "Non Homologué",
      "artist": "Jean-Jacques Goldman",
      "genre": "French variety",
      "photo": "https://i.scdn.co/image/ab6761610000e5eb5b0234933d862408792e19a3",
      "source": "http://localhost:4000/music/jjg-jetedonne.mp3",
      "image": "https://i.scdn.co/image/ab67616d0000b273faabb26835b3326341ded4a7",
      "trackNumber": 2,
      "totalTrackCount": 62,
      "duration": 264,
      "site": "https://library.soundfield.com/track/55"
    },
    {
      "id": "jjg_jemarcheseul03",
      "title": "Je Marche Seul",
      "album": "En Passant",
      "artist": "Jean-Jacques Goldman",
      "genre": "French variety",
      "photo": "https://i.scdn.co/image/ab6761610000e5eb5b0234933d862408792e19a3",
      "source": "http://localhost:4000/music/jjg-jemarcheseul.mp3",
      "image": "https://i.scdn.co/image/ab67616d0000b2739e4a83b7bd4ce083aa4fcefd",
      "trackNumber": 3,
      "totalTrackCount": 63,
      "duration": 251,
      "site": "https://library.soundfield.com/track/55"
    },
    {
      "id": "jjg_auboutdemesreves04",
      "title": "Au Bout De Mes Rêves",
      "album": "Gris Clair",
      "artist": "Jean-Jacques Goldman",
      "genre": "French variety",
      "photo": "https://i.scdn.co/image/ab6761610000e5eb5b0234933d862408792e19a3",
      "source": "http://localhost:4000/music/jjg-auboutdemesreves.mp3",
      "image": "https://i.scdn.co/image/ab67616d0000b2733a13ddfee30273b058cc643a",
      "trackNumber": 4,
      "totalTrackCount": 64,
      "duration": 227,
      "site": "https://library.soundfield.com/track/55"
    },
];

const artistsData = [
  {
      "id": "1",
      "name": "Rosalia",
      "photo": "https://i.scdn.co/image/ab67616d0000b2738f072024e0358fc5c62eba41"
  },
  {
      "id": "2",
      "name": "Gazo",
      "photo": "https://i.scdn.co/image/ab6761610000e5ebbbbe37f0550a982d8519da6c"
  },
  {
      "id": "3",
      "name": "The Weeknd",
      "photo": "https://i.scdn.co/image/ab6761610000e5eb214f3cf1cbe7139c1e26ffbb"
  },
  {
      "id": "4",
      "name": "David Guetta",
      "photo": "https://i.scdn.co/image/ab6761610000e5ebf150017ca69c8793503c2d4f"
  },
  {
      "id": "5",
      "name": "Drake",
      "photo": "https://i.scdn.co/image/ab6761610000e5eb4293385d324db8558179afd9"
  },
  {
      "id": "6",
      "name": "BTS",
      "photo": "https://i.scdn.co/image/ab67616100005174d642648235ebf3460d2d1f6a"
  },
{
  "id": "7",
  "name": "PLK",
  "photo": "https://i.scdn.co/image/ab6761610000e5eb7807ff8b003a33822c40d28c"
},
{
  "id": "8",
  "name": "Dua Lipa",
  "photo": "https://i.scdn.co/image/ab67616d0000b2732172b607853fa89cefa2beb4"
},
{
  "id": "9",
  "name": "DJ Snake",
  "photo": "https://i.scdn.co/image/ab6775700000ee855aa07053dfecc2cd1e45a6bf"
},
{
  "id": "10",
  "name": "Eminem",
  "photo": "https://i.scdn.co/image/ab6761610000e5eba00b11c129b27a88fc72f36b"
},
{
  "id": "11",
  "name": "Bad Bunny",
  "photo": "https://i.scdn.co/image/ab6761610000e5eb9ad50e478a469448c6f369df"
},
{
  "id": "12",
  "name": "PSY",
  "photo": "https://i.scdn.co/image/ab6761610000e5eb24b5185226d5b7c6aa91db5a"
},
{
  "id": "13",
  "name": "AC/DC",
  "photo": "https://i.scdn.co/image/ab6761610000e5ebc4c77549095c86acb4e77b37"
},
{
  "id": "14",
  "name": "Queen",
  "photo": "https://i.scdn.co/image/af2b8e57f6d7b5d43a616bd1e27ba552cd8bfd42"
},
{
  "id": "15",
  "name": "Indochine",
  "photo": "https://i.scdn.co/image/ab6761610000e5ebfd39ed4c2d6f08028cc1ce3c"
},
{
  "id": "16",
  "name": "Jean-Jacques Goldman",
  "photo": "https://i.scdn.co/image/ab6761610000e5eb5b0234933d862408792e19a3"
},
];

const playlistsData = [
  {
      "id": "1",
      "name": "Rap",
      "coverPhoto": "https://mir-s3-cdn-cf.behance.net/project_modules/hd/137625112577745.60177189ef503.png"
  },
  {
    "id": "2",
    "name": "Pop",
    "coverPhoto": "https://images.squarespace-cdn.com/content/v1/5e4d521a3d1e463a28d50504/1605302912205-J9KVVF35Z032MVCZ7KTP/IMG_2462.JPG"
},
{
  "id": "3",
  "name": "Electro/Dance",
  "coverPhoto": "https://i.scdn.co/image/ab67706f000000022bab08cc608f77ca29145a46"
},
{
  "id": "4",
  "name": "Hip-Hop",
  "coverPhoto": "https://i.scdn.co/image/ab67706f00000002c30623cd54c7a127429e4678"
},
{
  "id": "5",
  "name": "K-Pop",
  "coverPhoto": "https://image-cdn-ak.spotifycdn.com/image/ab67706c0000da842cc3143b16e4ea4efcbd5ffb"
},
{
  "id": "6",
  "name": "Latino",
  "coverPhoto": "https://i2.wp.com/hombre1.com/wp-content/uploads/2021/11/spotify-viva-latino-for-HOMBRE-Magazine-viva-latino-karol-g-211029-1-Copy.jpg"
},
{
  "id": "7",
  "name": "Rock",
  "coverPhoto": "https://i.scdn.co/image/ab67616d00001e02b95379557dbd1f0c30b7640e"
},
{
  "id": "8",
  "name": "French variety",
  "coverPhoto": "https://i.scdn.co/image/ab67616d0000b273e531723e6488137b2062af89"
},
];

// Endpoint pour récupérer toutes les données de musique
app.get('/music', (req, res) => {
    res.json({ music: musicData });
});

// Endpoint pour récupérer les données des artistes
app.get('/artists', (req, res) => {
    res.json({ artists: artistsData });
});

// Endpoint pour récupérer les données des playlists
app.get('/playlists', (req, res) => {
    res.json({ playlists: playlistsData });
});

// Démarrer le serveur
app.listen(port, () => {
    console.log(`Serveur API démarré sur le port ${port}`);
});