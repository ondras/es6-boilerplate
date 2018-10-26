export default async function stuff() {
	let response = await fetch("/");
	alert(`It works! HTTP/${response.status}`);
}
