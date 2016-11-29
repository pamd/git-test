Some notes on debugging front-end JavaScript in our ngbp framework:
===================================================================
(written by Matt on 08/09/2016 Slack AngularJS Channel)

Learn about developer mode
--------------------------

This often goes without saying, but it is important to get familiar with the
developer mode of your browser of choice. Many people swear by Chrome, and it
is indeed very good, but Safari and Firefox also have good tools worth exploring.

Getting a look at the data
--------------------------

1. Adding **$log.info();** will add an entry to the console log (this is the AngularJS way of doing **console.log()** in plain JavaScript).

2. Add the following to your HTML fragment (**foo.tpl.html**) to get a look at some scope variable right inside the web view you're working on:

   ```
   <pre>{{ foobarObject | json }}</pre>
   ```

   This will "pretty-print" a **foobarObject** which may be too big to get a look at in the JavaScript console.

3. To inspect the Angular **$scope** for a part of your DOM, open up debug mode in your browser and use the "point to inspect" tool to select the Angular component you want to examine or select the corresponding node via the HTML in the "elements" tab of the debugger. In Chrome or Safari at least this will associate that DOM node with the variable $0. Once you've done this, you can type the following into the JavaScript console:

   ```
   js_console> angular.element($0).scope()
   ```

   and you will get back an object with all scope variables for your inspection.

4. To get a snapshot of data from some REST API (this one searches for 'pa14' on the adage-server), you can do:

   ```
   shell> curl "http://host/api/v0/search/?limit=0&q=pa14" | python -m json.tool > blah.out.json
   ```


Jumping into debug mode
-----------------------

You can always set a breakpoint in your browser's developer mode, but with some JavaScript libraries it can be next to impossible to sort out where to start. Here are some tips specific to ngbp that make it much less impossible.

**Important**: work with a debug build.

A full build of the interface will produce minified JavaScript. This is important for packing the code into a small payload that minimizes the wait that users will experience for the initial page load, but debugging minified JavaScript is akin to stepping through C++ code that has been stripped of its symbols. It can be done but it is a brutal experience.

So we need a debug build. The good news is that ngbp builds one along the way to producing its final output. (Have a look in **interface/build/** after a successful **grunt** build.) But the code we push to Bitbucket is configured to generate our production output by default so we need to take extra steps to "rewire" the web server to point to this intermediate build. Here is what to do:

1. Change where Django looks when serving up static files:

   ```
   shell> cd adage-server/adage
   shell> rm static
   shell> ln -s ../interface/build static
   ```

2. Change the "template" Django uses:

   ```
   shell> cd adage-server/adage/templates
   shell> rm index.html
   shell> ln -s ../../interface/build/index.html index.html
   ```

3. Restart gunicorn (Django's "host" process, managed by **supervisord**)

   ```
   shell> sudo supervisorctl restart adage
   ```

Your development configuration is now serving the debug build of the interface. At this point, you can place a **debugger;** statement into the AngularJS source where you want it and the browser will drop into debug mode right at that statement.
