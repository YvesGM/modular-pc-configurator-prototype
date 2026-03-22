export async function fetchData() {
    const fetchedData = await fetch("./components/components.php");
    return await fetchedData.json();
}