#!/usr/bin/env node
import fs from "node:fs/promises";
import path from "node:path";
import { documents, redirects } from "./documents.js";
import { renderHomepage } from "./homepage.js";

const outputRoot = path.resolve(new URL(".", import.meta.url).pathname, "..", "site");

// The fragment is carried over so that links to a heading keep working after the move.
function redirectPage(target) {
  const href = `/${target}`;
  return `<!doctype html>
<html lang="ja">
<head>
<meta charset="utf-8">
<title>移転しました</title>
<link rel="canonical" href="${href}">
<meta http-equiv="refresh" content="0; url=${href}">
<script>location.replace(${JSON.stringify(href)} + location.hash);</script>
</head>
<body><p>この原稿は <a href="${href}">${href}</a> に移転しました。</p></body>
</html>
`;
}

await fs.rm(outputRoot, { recursive: true, force: true });
await fs.mkdir(outputRoot, { recursive: true });
await fs.writeFile(path.join(outputRoot, "index.html"), await renderHomepage(documents), "utf8");
for (const [from, to] of Object.entries(redirects)) {
  await fs.mkdir(path.join(outputRoot, from), { recursive: true });
  await fs.writeFile(path.join(outputRoot, from, "index.html"), redirectPage(to), "utf8");
}
console.log("Generated site/.");
