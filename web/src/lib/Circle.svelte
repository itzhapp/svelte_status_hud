<script lang="ts">

    import Icon from 'svelte-awesome'
    import { faHeart, faShieldAlt, faBolt, faBurger, faDroplet, faBrain } from '@fortawesome/free-solid-svg-icons';

	export let width = 200;
	export let lineWidth = 30;
	export let bgColor = 'hsla(13, 58%, 91%, 1)';
	export let color = 'hsla(8, 59%, 65%, 1)';
	export let textColor = 'hsla(0, 0%, 20%, 1)';
	export let responsive = false;
	export let percent = 0;
	export let rounded = false;
	export let animation = true;
	export let iconX = "25%";
	export let iconY = "25%";
    export let iconText = 'heart';

    let icon;

	switch (iconText) {
		case 'heart':
			icon = faHeart;
			break;
		case 'shield':
			icon = faShieldAlt;
			break;
		case 'bolt':
			icon = faBolt;
			break;
		case 'burger':
			icon = faBurger;
			break;
		case 'water':
			icon = faDroplet;
			break;
		case 'brain':
			icon = faBrain;
			break;
		default:
			icon = faHeart;
			break;
	}

	let svgWidth: number | string = '';

	$: if (responsive) {
		svgWidth = '100%';
	} else {
		svgWidth = width;
	}

	$: offset = 1100 * (1 - percent / 100);
</script>

<div class="svg-progress-ring">
	<svg
		xmlns="http://www.w3.org/2000/svg"
		width={svgWidth}
		height="10vh"
		viewBox="-25 -25 400 400"
	>
		<circle stroke={bgColor} cx="175" cy="175" r="175" stroke-width={lineWidth} fill="black" />
		<circle
			stroke={color}
			transform="rotate(-90 175 175)"
			cx="175"
			cy="175"
			r="175"
			stroke-dasharray="1100"
			stroke-width={lineWidth}
			stroke-dashoffset={offset}
			stroke-linecap={rounded ? 'round' : 'butt'}
			fill="none"
			style="transition: {animation ? 'stroke-dashoffset 0.5s ease-out' : 'none'}"
		/>
		<Icon class="fas-fa-icon" scale={10} data={icon} style="color: white; background-color: white;" fill={textColor} x={iconX} y={iconY}/>
	</svg>
</div>