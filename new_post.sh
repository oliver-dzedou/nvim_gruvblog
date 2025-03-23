#!/bin/bash
# Ask for the blog post title
read -p "Enter blog post title: " post_title

# Create a normalized file name based on the title (lowercase and underscores)
file_name="blog_post_$(echo "$post_title" | tr '[:upper:]' '[:lower:]' | sed 's/ /_/g').html"

# Create the new blog post file with the title inserted in all placeholder positions
cat <<EOF > "$file_name"
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>${post_title} - dzedou</title>
  <meta name="description" content="Blog post: ${post_title} by dzedou">
  <link rel="stylesheet" href="styles.css">
  <!-- Load JetBrains Mono from Google Fonts -->
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=JetBrains+Mono&display=swap" rel="stylesheet">
</head>
<body>
  <!-- Top Navigation -->
  <nav class="top-nav">
    <a href="about.html">About</a>
    <a href="index.html" class="active">Blog</a>
    <a href="contact.html">Contact</a>
  </nav>
  
  <!-- Main Editor Container -->
  <div class="editor">
    <div class="gutter"></div>
    <div class="editor-content">
      <h1>${post_title}</h1>
      <!-- Insert post content here -->
    </div>
  </div>
  
  <!-- Static Status Bar -->
  <div class="status-bar">-- dzedou --</div>
  
  <script src="script.js"></script>
</body>
</html>
EOF

echo "Created blog post: $file_name"
