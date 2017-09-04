var sampleArray = [1, 2, 3, 4, 5, 6]
var sampleObject = {
	key1: 'some value',
	key2: 'another value',
	key3: 789
}

function print(item) {
	console.log(item)
}

function square(item) {
	return (item * item)
}

Array.prototype.myEach = function(callback) {
	for (var i = 0; i < this.length; i++) {
		callback.call(this, this[i]);
	}
};

Array.prototype.myMap = function(callback) {
	let result = []
	this.myEach(item => result.push(callback(item)))
	return result
};

var newArray = sampleArray.myMap(square);
newArray.myEach(print)
sampleArray.myMap(item => item*2);

// Bianca Gandalfo's course

// exercise 1

function funcCaller(arg, callback) {
	return callback(arg);
}
funcCaller(2, print)

// exercise 2

function firstVal(array, callback) {
	callback(array[0], 0, array)
}

function triplePrint(item, num, array) {
	console.log(item)
	console.log(num)
	console.log(array)
}
firstVal(sampleArray, triplePrint)

// exercise 3

function refactoredFirstVal(input, callback) {
	if (Array.isArray(input)) {
		callback(input[0], 0, input)	
	} else if (typeof input === 'object') {
		let keyArray = Object.keys(input)
		callback(keyArray[0], 0, input)
	}
}
refactoredFirstVal(sampleArray, triplePrint)
refactoredFirstVal(sampleObject, triplePrint)

// exercise 4

function once(callback) {
	let complete = false
	return function() {
		if (!complete) {
			callback.apply(null, arguments)
			complete = true
		} else {
			console.log('already called')
		}
	}
}
let printOnce = once(print)
printOnce(333333)
printOnce(333333)