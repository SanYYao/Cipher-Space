module.exports = function(eleventyConfig) {
  // Copy static assets
  eleventyConfig.addPassthroughCopy("css");
  
  // Markdown processing
  eleventyConfig.addFilter("head", (array, n) => {
    if(!Array.isArray(array) || array.length === 0) return [];
    if(n < 0) return array.slice(n);
    return array.slice(0, n);
  });

  return {
    dir: {
      input: ".",
      output: "_site",
      includes: "_includes",
    },
    pathPrefix: "/",
    templateFormats: ["md", "html"],
    markdownTemplateEngine: "njk",
    htmlTemplateEngine: "njk",
  };
};
