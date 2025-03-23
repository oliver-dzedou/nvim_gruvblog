// Update dynamic line numbers based on rendered content lines
function updateLineNumbers() {
    const editorContent = document.querySelector('.editor-content');
    const gutter = document.querySelector('.gutter');
    if (!editorContent || !gutter) return;
    
    // Clear previous line numbers
    gutter.innerHTML = '';
    
    // Get the computed line-height and content height
    const style = window.getComputedStyle(editorContent);
    const lineHeight = parseFloat(style.lineHeight);
    const height = editorContent.clientHeight;
    
    // Calculate number of lines (approximate)
    const numLines = Math.ceil(height / lineHeight);
    
    for (let i = 1; i <= numLines; i++) {
      const lineNum = document.createElement('div');
      lineNum.textContent = i;
      gutter.appendChild(lineNum);
    }
  }
  
  // Update line numbers on page load and when window is resized
  document.addEventListener('DOMContentLoaded', updateLineNumbers);
  window.addEventListener('resize', updateLineNumbers);
