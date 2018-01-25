realtime-location-app-arkit-corelocation-pusher

there is 2 apps,

one for your iOS device, 

and other is for taxi cab to track its location (you need to either register in <a href="https://dashboard.pusher.com/">Pusher system</a> or use Node.js script to manually send some location coordinates (that you can get from this <a href="https://www.latlong.net/convert-address-to-lat-long.html">site</a>) every two seconds.

const Pusher = require('pusher');

    const pusher = new Pusher({
      appId: 'YOUR_PUSHER_APP_',
      key: 'YOUR_PUSHER_APP_KEY',
      secret: 'YOUR_PUSHER_APP_SECRET',
      cluster: 'YOUR_PUSHER_APP_CLUSTER',
      encrypted: true
    });

    const locations = [
        {latitude: "", longitude: "-", heading: ""},
        {latitude: "", longitude: "-", heading: ""},
        {latitude: "", longitude: "-", heading: ""},
        {latitude: "", longitude: "-", heading: ""},
        {latitude: "", longitude: "-", heading: ""},
        {latitude: "", longitude: "-", heading: ""},
        {latitude: "", longitude: "-", heading: ""},
        {latitude: "", longitude: "-", heading: ""},
        {latitude: "", longitude: "-", heading: ""}
    ];

    locations.forEach((loc, index) => {
        setTimeout(() => {
            console.log(loc);
            pusher.trigger('private-channel', 'client-new-location', loc);
        }, 2000*index);
    });
    
    Once you have Node.js installed, you just have to copy this script to a file, let’s say publish.js, create a package.json file with the command:

    npm init
Install the Pusher Node.js library with:

    npm install --save pusher
Enter your Pusher and location info and execute the script with:

    node publish.js
Once the app starts receiving location events, the 3D model of the car will appear in the direction where it is in the real world (with a small size if it’s far from you)
