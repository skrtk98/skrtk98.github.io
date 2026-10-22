import fs from "node:fs/promises";

function escapeHtml(value) {
  return value.replace(/[&<>"']/g, (character) => ({ "&": "&amp;", "<": "&lt;", ">": "&gt;", '"': "&quot;", "'": "&#39;" })[character]);
}

// DADS references and license information are recorded in homepage/THIRD_PARTY_LICENSES.md.
// This standalone index does not change the Markdown Preview Enhanced book layout.
export async function renderHomepage(documents) {
  const css = await fs.readFile(new URL("./homepage.css", import.meta.url), "utf8");
  const groups = [
    { id: "category", title: "圏論", subtitle: "構造と関係を記述する", number: "01" },
    { id: "topology", title: "位相空間論", subtitle: "空間の性質を捉える", number: "02" },
    { id: "algebra", title: "代数学", subtitle: "線形な構造を扱う", number: "03" },
    { id: "analysis", title: "解析学", subtitle: "無限次元の空間を扱う", number: "04" },
  ];
  const sections = groups.map((group) => {
    const items = documents.filter((document) => document.group === group.id);
    if (items.length === 0) return "";
    const cards = items.map(({ href, title, description }) => `<li class="document-card">
      <h4><a href="${href}">${escapeHtml(title)}</a></h4>
      <p>${escapeHtml(description)}</p>
      <span class="card-arrow" aria-hidden="true">→</span>
    </li>`).join("\n");
    return `<section class="document-group" aria-labelledby="${group.id}-heading">
      <div class="group-heading"><span class="group-number" aria-hidden="true">${group.number}</span><h3 id="${group.id}-heading">${group.title}</h3><p>${group.subtitle}</p></div>
      <ul class="document-grid">${cards}</ul>
    </section>`;
  }).join("\n");
  return `<!doctype html>
<html lang="ja">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="圏論と位相空間論を中心とした、個人の数学学習ノート。定義、命題、例をまとめた原稿を公開しています。">
<title>数学の学習ノート | Personal Mathematical Documents</title>
<style>${css}</style>
</head>
<body>
<a class="skip-link" href="#main">本文へ移動</a>
<header class="site-header">
  <div class="container header-inner">
    <a class="site-name" href="./" aria-label="数学の学習ノート トップページ"><span class="site-mark" aria-hidden="true">∴</span>数学の学習ノート</a>
    <nav aria-label="サイト内ナビゲーション"><a href="#documents">原稿一覧</a><a href="#about">このサイトについて</a></nav>
  </div>
</header>
<main id="main" tabindex="-1">
  <section class="hero" aria-labelledby="page-title">
    <div class="container hero-inner">
      <p class="eyebrow">PERSONAL MATHEMATICAL DOCUMENTS</p>
      <h1 id="page-title">数学の学習ノート</h1>
      <p class="hero-description">定義から、構造と関係をたどる。<br>圏論と位相空間論を中心にまとめた、個人の学習記録。</p>
      <a class="hero-link" href="#documents">原稿を読む<span aria-hidden="true">↓</span></a>
    </div>
  </section>
  <div class="container content">
    <section id="documents" aria-labelledby="documents-heading">
      <div class="section-heading"><h2 id="documents-heading">原稿一覧</h2><p>全${documents.length}編</p></div>
      ${sections}
    </section>
    <section id="about" class="about" aria-labelledby="about-heading">
      <h2 id="about-heading">このサイトについて</h2>
      <div><p>数学を学ぶ過程で整理した、教科書的な資料を公開している。<br>定義、命題、例を参照しながら、各分野の概念をたどるためのノートである。</p>
      <a href="https://github.com/skrtk98/skrtk98.github.io#原稿のリポジトリ">原稿とソースコードを見る（GitHub）<span aria-hidden="true"> ↗</span></a></div>
    </section>
  </div>
</main>
<footer class="site-footer"><div class="container footer-inner"><p>Personal Mathematical Documents</p><a href="#page-title">ページの先頭へ<span aria-hidden="true"> ↑</span></a></div></footer>
</body>
</html>
`;
}
