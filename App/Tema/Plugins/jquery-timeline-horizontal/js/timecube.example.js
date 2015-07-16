// Prevent scrolling
document.body.addEventListener('touchstart', function(e){  
	// allow clicks on links within the moveable area
	if($(e.target).is('a, iframe')) {
		return true;
	}
	e.preventDefault();
});


document.body.addEventListener('touchmove', function(e){ 
	e.preventDefault();
});

var json = 
    [
        {
            title: '13/08/1996',
            description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur eu risus tortor. Nam dui tellus, porta at libero eu, tempor rutrum tortor.",
            startDate: new Date('1996-08-13'),
            endDate: null
	},
        {
            title: '13/08/2009',
            description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur eu risus tortor. Nam dui tellus, porta at libero eu, tempor rutrum tortor.",
            startDate: new Date('2009-08-13'),
            endDate: null
	}        
    ];





$("#timeline").timeCube({
    data: json,
    granularity: "decade",
    startDate: new Date('1984-08-13'),
    endDate: new Date('2015-08-13'),
    nextButton: $("#next-link"),
    previousButton: $("#prev-link"),
    showDate: false
});
