export async function fetchComponents() {
    const res = await fetch("./components/components.php");
    return await res.json();
}