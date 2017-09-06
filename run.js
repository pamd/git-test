// "You don't know JS: Async & Performance", Page 149
// Implementation of run(..) function. 
// Revised by dhu to make it easier to follow.
// Thanks to Benjamin Gruenbaum (@benjamingr on GitHub) for
// big improvements here!
function run(gen) {
  var args = [].slice.call( arguments, 1), it;

  // Initialize the generator in the current context
  it = gen.apply(this, args);

  // Definition of handleNext(..), which will be called later.
  function handleNext(value) {
    // Definition of handleResult(..)
    function handleResult(next) {
      if (next.done) { // the generator completed running
	return next.value;
      }

      // Otherwise keep going:
      return Promise.resolve(next.value).then(
	// Resume the async loop on success, sending the resolved
	// value back into the generator
	handleNext, // recursive call of handleNext(..)
	// If 'value' is a rejected promise, propagate error back
	// into the generator for its own error handling
	function handleErr(err) {
	  return Promise.resolve(it.throw(err))
            .then(handleResult); // recursive call of handleNext(..)
	}
      );
    } // end of definition of handleResult(..)

    var next = it.next(value); // Run to the next yielded value
    return handleResult(next); // Invocation of handleResult(..)
  } // end of definition of handleNext(..)

  // Invoke handleNext(..) and return a promise for the generator completing
  return Promise.resolve().then(handleNext);
}
