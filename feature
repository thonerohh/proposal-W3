// move object to place ._.
async function moveHTMLContent(place, object) {
  try {
    const pagePattern = await loadHTMLContent(object);
    const targetPlace = document.querySelector(place);
    if (pagePattern) {
      if (targetPlace) {
        targetPlace.innerHTML = pagePattern;
      } else {
        console.error('Target element not found for selector:', selector);
      }
    } else {
      console.error('Page pattern content not loaded for step number:', stepNumber);
    }
  } catch (error) {
    console.error('Error updating page content:', error);
  }
}
// load object ._
async function loadHTMLContent(url) {
  try {
    const response = await fetch(url);
    if (!response.ok) {
      throw new Error(`HTTP error! status: ${response.status}`);
    }
    return await response.text(); // assuming the content is text/HTML
  } catch (error) {
    console.error("Could not load HTML content:", error);
    return null;
  }
}
