'use strict';

const ce = React.createElement;

class Intro extends React.Component {
	constructor(props) {
		super(props);
		
		this.state = {
			liked: false 
		};
	}

	render() {
		if (this.state.liked) {
			return "Designed By Christopher Francisco";
		}
		return ce(
			'label', 
			{ onClick: () => this.setState({ liked:true })}, 
			'intro'
			);
	}
}

ReactDOM.render(
	ce(Intro, "click me!"),
	document.getElementById("intro")
);

console.log("hellowow");
