<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width,initial-scale=1" />
  <title>SQL Query Addition — project02_sql_queries.sql</title>
  <meta name="description" content="Add a SELECT query to display caption_id, caption, and author last name from the newly created authors table." />

  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Fraunces:opsz,wght@9..144,500,650,800&family=IBM+Plex+Sans:wght@400;500;600&display=swap" rel="stylesheet">

  <style>
    :root{
      --bg: #0b0f14;
      --panel: rgba(255,255,255,.06);
      --panel2: rgba(255,255,255,.085);
      --text: rgba(255,255,255,.92);
      --muted: rgba(255,255,255,.72);
      --faint: rgba(255,255,255,.14);
      --accent: #c9ff6b;
      --accent2: #7dd3ff;
      --warning: #ffd27d;
      --shadow: 0 18px 60px rgba(0,0,0,.55);
      --radius: 18px;
      --radius2: 26px;
    }

    *{ box-sizing:border-box; }
    html,body{ height:100%; }
    body{
      margin:0;
      font-family: "IBM Plex Sans", system-ui, -apple-system, Segoe UI, sans-serif;
      color: var(--text);
      background:
        radial-gradient(1000px 600px at 15% 15%, rgba(201,255,107,.18), transparent 60%),
        radial-gradient(900px 500px at 85% 25%, rgba(125,211,255,.16), transparent 62%),
        radial-gradient(700px 700px at 60% 90%, rgba(255,210,125,.10), transparent 60%),
        linear-gradient(180deg, #070a0f 0%, #0b0f14 55%, #070a0f 100%);
      overflow-x:hidden;
    }

    .noise{
      pointer-events:none;
      position:fixed;
      inset:0;
      background-image:
        url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='180' height='180'%3E%3Cfilter id='n'%3E%3CfeTurbulence type='fractalNoise' baseFrequency='.8' numOctaves='3' stitchTiles='stitch'/%3E%3C/filter%3E%3Crect width='180' height='180' filter='url(%23n)' opacity='.22'/%3E%3C/svg%3E");
      mix-blend-mode: overlay;
      opacity:.35;
    }

    header{
      position:sticky;
      top:0;
      z-index:10;
      backdrop-filter: blur(14px);
      background: linear-gradient(180deg, rgba(11,15,20,.78), rgba(11,15,20,.45));
      border-bottom: 1px solid rgba(255,255,255,.08);
    }

    .wrap{
      width:min(1040px, calc(100% - 2rem));
      margin-inline:auto;
    }

    .nav{
      display:flex;
      align-items:center;
      justify-content:space-between;
      padding: 1rem 0;
      gap: 1rem;
    }

    .brand{
      display:flex;
      align-items:baseline;
      gap:.65rem;
      letter-spacing:.02em;
    }
    .brand strong{
      font-family:"Fraunces", serif;
      font-weight:800;
      font-size: 1.05rem;
    }
    .brand span{
      color: var(--muted);
      font-size:.92rem;
    }

    .pill{
      display:inline-flex;
      align-items:center;
      gap:.5rem;
      padding:.55rem .8rem;
      border-radius:999px;
      border: 1px solid rgba(255,255,255,.12);
      background: rgba(255,255,255,.04);
      color: var(--muted);
      font-size:.9rem;
      white-space:nowrap;
    }
    .dot{
      width:.55rem;height:.55rem;border-radius:50%;
      background: conic-gradient(from 180deg, var(--accent), var(--accent2), var(--warning), var(--accent));
      box-shadow: 0 0 0 4px rgba(201,255,107,.10);
    }

    main{ padding: 2.4rem 0 3.2rem; }

    .hero{
      display:grid;
      grid-template-columns: 1.1fr .9fr;
      gap: 1.2rem;
      align-items:stretch;
      margin-top: .6rem;
    }
    @media (max-width: 900px){
      .hero{ grid-template-columns: 1fr; }
    }

    .heroCard{
      border-radius: var(--radius2);
      background: linear-gradient(180deg, rgba(255,255,255,.07), rgba(255,255,255,.04));
      border: 1px solid rgba(255,255,255,.11);
      box-shadow: var(--shadow);
      overflow:hidden;
      position:relative;
      padding: clamp(1.25rem, 2.4vw, 1.9rem);
    }

    .heroCard::before{
      content:"";
      position:absolute;
      inset:-2px;
      background:
        radial-gradient(800px 220px at 25% 10%, rgba(201,255,107,.28), transparent 58%),
        radial-gradient(680px 220px at 90% 0%, rgba(125,211,255,.22), transparent 62%),
        radial-gradient(520px 260px at 70% 100%, rgba(255,210,125,.16), transparent 60%);
      opacity:.75;
      filter:saturate(1.05);
      pointer-events:none;
    }

    .heroCard > *{ position:relative; }

    h1{
      margin: 0 0 .6rem;
      font-family:"Fraunces", serif;
      font-weight:800;
      line-height:1.05;
      font-size: clamp(1.7rem, 3.1vw, 2.6rem);
      letter-spacing: .01em;
    }
    .lead{
      margin:0 0 1rem;
      color: var(--muted);
      font-size: 1.02rem;
      line-height:1.6;
      max-width: 62ch;
    }

    .metaRow{
      display:flex;
      flex-wrap:wrap;
      gap:.6rem;
      margin-top:.8rem;
    }

    .side{
      display:grid;
      gap: 1rem;
    }

    .sidePanel{
      border-radius: var(--radius);
      background: linear-gradient(180deg, rgba(255,255,255,.06), rgba(255,255,255,.035));
      border: 1px solid rgba(255,255,255,.10);
      box-shadow: 0 12px 50px rgba(0,0,0,.45);
      padding: 1.05rem 1.05rem;
      overflow:hidden;
      position:relative;
    }

    .sidePanel h2{
      margin:.15rem 0 .35rem;
      font-family:"Fraunces", serif;
      font-weight:650;
      font-size: 1.15rem;
      letter-spacing:.01em;
    }
    .sidePanel p{
      margin:0;
      color: var(--muted);
      line-height:1.55;
      font-size:.96rem;
    }

    .codeBlock{
      margin-top: 1.2rem;
      border-radius: 16px;
      border: 1px solid rgba(255,255,255,.12);
      background: rgba(0,0,0,.28);
      overflow:hidden;
    }
    .codeTop{
      display:flex;
      align-items:center;
      justify-content:space-between;
      gap:1rem;
      padding: .75rem .85rem;
      border-bottom: 1px solid rgba(255,255,255,.10);
      background: rgba(255,255,255,.04);
    }
    .fileTag{
      display:flex;
      align-items:center;
      gap:.6rem;
      color: var(--muted);
      font-size:.92rem;
    }
    .fileIcon{
      width: 22px; height: 22px;
      border-radius: 6px;
      background: linear-gradient(135deg, rgba(201,255,107,.25), rgba(125,211,255,.18));
      border: 1px solid rgba(255,255,255,.12);
      display:grid;
      place-items:center;
    }
    .fileIcon svg{ opacity:.92; }

    .btn{
      appearance:none;
      border: 1px solid rgba(255,255,255,.16);
      background: linear-gradient(180deg, rgba(255,255,255,.08), rgba(255,255,255,.03));
      color: var(--text);
      padding: .55rem .75rem;
      border-radius: 12px;
      font-weight:600;
      font-size:.92rem;
      cursor:pointer;
      transition: transform .15s ease, border-color .15s ease, background .15s ease;
      display:inline-flex;
      align-items:center;
      gap:.55rem;
      user-select:none;
    }
    .btn:hover{
      transform: translateY(-1px);
      border-color: rgba(201,255,107,.35);
      background: linear-gradient(180deg, rgba(201,255,107,.12), rgba(255,255,255,.03));
    }
    .btn:active{ transform: translateY(0px) scale(.99); }

    pre{
      margin:0;
      padding: 1rem .95rem 1.05rem;
      overflow:auto;
      font-size:.95rem;
      line-height:1.6;
      color: rgba(255,255,255,.90);
    }
    code{
      font-family: ui-monospace, SFMono-Regular, Menlo, Monaco, Consolas, "Liberation Mono", "Courier New", monospace;
    }

    .hint{
      margin-top: .9rem;
      padding: .85rem .95rem;
      border-radius: 14px;
      background: rgba(255,255,255,.04);
      border: 1px dashed rgba(255,255,255,.16);
      color: var(--muted);
      line-height:1.55;
      font-size:.95rem;
    }

    .reveal{ opacity:0; transform: translateY(10px); }
    .reveal.in{
      animation: rise .55s cubic-bezier(.2,.9,.2,1) forwards;
    }
    @keyframes rise{
      to { opacity:1; transform: translateY(0); }
    }

    footer{
      padding: 1.8rem 0 2.6rem;
      border-top: 1px solid rgba(255,255,255,.08);
      color: var(--muted);
      font-size:.92rem;
    }

    .toast{
      position: fixed;
      left: 50%;
      bottom: 18px;
      transform: translateX(-50%);
      background: rgba(10,13,18,.78);
      border: 1px solid rgba(255,255,255,.14);
      backdrop-filter: blur(12px);
      border-radius: 999px;
      padding: .7rem .95rem;
      color: rgba(255,255,255,.92);
      box-shadow: 0 14px 60px rgba(0,0,0,.55);
      opacity:0;
      pointer-events:none;
      transition: opacity .18s ease, transform .18s ease;
      display:flex;
      align-items:center;
      gap:.6rem;
      max-width: min(720px, calc(100% - 2rem));
      font-size:.92rem;
    }
    .toast.show{
      opacity:1;
      transform: translateX(-50%) translateY(-2px);
    }
    .kbd{
      font-family: ui-monospace, SFMono-Regular, Menlo, Monaco, Consolas, "Liberation Mono", "Courier New", monospace;
      font-size:.9em;
      padding:.15rem .45rem;
      border-radius: 8px;
      border: 1px solid rgba(255,255,255,.14);
      background: rgba(255,255,255,.05);
      color: rgba(255,255,255,.86);
    }
  </style>
</head>

<body>
  <div class="noise" aria-hidden="true"></div>

  <header>
    <div class="wrap">
      <div class="nav">
        <div class="brand" aria-label="Page title">
          <strong>SQL Query Update</strong>
          <span>project02_sql_queries.sql</span>
        </div>
        <div class="pill" title="Single query requested">
          <span class="dot" aria-hidden="true"></span>
          <span>Query 1: captions + author last name</span>
        </div>
      </div>
    </div>
  </header>

  <main class="wrap">
    <section class="hero">
      <article class="heroCard reveal" style="animation-delay:.02s">
        <h1>Add this SELECT query to <em>project02_sql_queries.sql</em></h1>
        <p class="lead">
          Requested output: <strong>caption_id</strong>, <strong>caption</strong>, and the author’s <strong>last name</strong>
          from the newly created <strong>authors</strong> table (via a join to captions).
        </p>

        <div class="codeBlock" role="region" aria-label="SQL snippet">
          <div class="codeTop">
            <div class="fileTag">
              <span class="fileIcon" aria-hidden="true">
                <svg width="14" height="14" viewBox="0 0 24 24" fill="none">
                  <path d="M7 3h7l3 3v15a3 3 0 0 1-3 3H7a3 3 0 0 1-3-3V6a3 3 0 0 1 3-3Z" stroke="rgba(255,255,255,.85)" stroke-width="1.7"/>
                  <path d="M14 3v4a2 2 0 0 0 2 2h4" stroke="rgba(255,255,255,.85)" stroke-width="1.7"/>
                </svg>
              </span>
              <span><strong>project02_sql_queries.sql</strong> — append this query</span>
            </div>
            <button class="btn" id="copyBtn" type="button" aria-label="Copy SQL to clipboard">
              <span aria-hidden="true">⧉</span>
              Copy SQL
            </button>
          </div>
          <pre><code id="sqlCode">SELECT
  c.caption_id,
  c.caption,
  a.last_name
FROM captions AS c
JOIN authors  AS a
  ON a.author_id = c.author_id;</code></pre>
        </div>

        <div class="hint reveal" style="animation-delay:.10s">
          If your schema uses different key names (e.g., <span class="kbd">caption.author_id</span> or <span class="kbd">captions.authors_id</span>),
          update the <span class="kbd">ON</span> clause accordingly, but keep the same three selected columns.
        </div>

        <div class="metaRow reveal" style="animation-delay:.16s" aria-label="Notes">
          <span class="pill">Uses an <span class="kbd">INNER JOIN</span></span>
          <span class="pill">Outputs 3 columns only</span>
          <span class="pill">No external dependencies</span>
        </div>
      </article>

      <aside class="side">
        <section class="sidePanel reveal" style="animation-delay:.08s">
          <h2>What this does</h2>
          <p>
            Joins <span class="kbd">captions</span> to <span class="kbd">authors</span> on <span class="kbd">author_id</span> and returns:
            <span class="kbd">caption_id</span>, <span class="kbd">caption</span>, <span class="kbd">last_name</span>.
          </p>
        </section>

        <section class="sidePanel reveal" style="animation-delay:.14s">
          <h2>Alternative (if you need all captions)</h2>
          <p>
            If captions can exist without an author, use <span class="kbd">LEFT JOIN</span> instead of <span class="kbd">JOIN</span>.
          </p>
          <div class="codeBlock" style="margin-top:.85rem">
            <div class="codeTop">
              <div class="fileTag">
                <span class="fileIcon" aria-hidden="true">
                  <svg width="14" height="14" viewBox="0 0 24 24" fill="none">
                    <path d="M7 3h7l3 3v15a3 3 0 0 1-3 3H7a3 3 0 0 1-3-3V6a3 3 0 0 1 3-3Z" stroke="rgba(255,255,255,.85)" stroke-width="1.7"/>
                    <path d="M14 3v4a2 2 0 0 0 2 2h4" stroke="rgba(255,255,255,.85)" stroke-width="1.7"/>
                  </svg>
                </span>
                <span>Optional variant</span>
              </div>
              <button class="btn" id="copyBtn2" type="button" aria-label="Copy optional SQL to clipboard">
                <span aria-hidden="true">⧉</span>
                Copy
              </button>
            </div>
            <pre><code id="sqlCode2">SELECT
  c.caption_id,
  c.caption,
  a.last_name
FROM captions AS c
LEFT JOIN authors AS a
  ON a.author_id = c.author_id;</code></pre>
          </div>
        </section>
      </aside>
    </section>
  </main>

  <footer>
    <div class="wrap">
      <div>Tip: You can paste directly into <span class="kbd">project02_sql_queries.sql</span>. Press <span class="kbd">Copy SQL</span> to copy the snippet.</div>
    </div>
  </footer>

  <div class="toast" id="toast" role="status" aria-live="polite">
    <span class="dot" aria-hidden="true"></span>
    <span id="toastText">Copied to clipboard.</span>
  </div>

  <script>
    // Staggered reveal
    const io = new IntersectionObserver((entries) => {
      entries.forEach((e) => {
        if (e.isIntersecting) e.target.classList.add('in');
      });
    }, { threshold: 0.12 });

    document.querySelectorAll('.reveal').forEach((el, i) => {
      el.style.animationDelay = (Number(el.style.animationDelay?.replace('s','')) || 0) + (i * 0.03) + 's';
      io.observe(el);
    });

    const toast = document.getElementById('toast');
    const toastText = document.getElementById('toastText');
    let toastTimer;

    function showToast(msg){
      toastText.textContent = msg;
      toast.classList.add('show');
      clearTimeout(toastTimer);
      toastTimer = setTimeout(() => toast.classList.remove('show'), 1400);
    }

    async function copyFrom(id){
      const el = document.getElementById(id);
      const text = el?.innerText || '';
      try{
        await navigator.clipboard.writeText(text);
        showToast('Copied SQL to clipboard.');
      }catch(err){
        // Fallback
        const ta = document.createElement('textarea');
        ta.value = text;
        document.body.appendChild(ta);
        ta.select();
        document.execCommand('copy');
        ta.remove();
        showToast('Copied (fallback).');
      }
    }

    document.getElementById('copyBtn').addEventListener('click', () => copyFrom('sqlCode'));
    document.getElementById('copyBtn2').addEventListener('click', () => copyFrom('sqlCode2'));
  </script>
</body>
</html>

  /*Select the web19101 database and using the SQL tab run the following query */
  
  CREATE TABLE web19101.authors (
  author_id int not NULL auto_increment,
  first_name varchar(255) NULL,
  last_name  varchar(255) NULL,
  email      varchar(255) NULL,
  phone      varchar(255) NULL,
  create_dt  date NULL,
  primary key (author_id));

/*Select the web19101 database and using the SQL tab run the following query */

  ALTER TABLE web19101.captions
  ADD COLUMN author_id INT AFTER caption;
  
/*Select the authors table and using the SQL tab run the following queries */

  insert into authors(first_name, last_name, email, phone, create_dt)
  values('John', 'Smith', 'jsmith@hotmail.com', '618 622-0001', sysdate());
  insert into authors(first_name, last_name, email, phone, create_dt)
  values('Akim', 'Obedella', 'aobedella@hotmail.com', '212 601-1112', sysdate());
  insert into authors(first_name, last_name, email, phone, create_dt)
  values('Jen', 'Potifer', 'jpotifer@yahoo.com', '812 567-3332', sysdate());
  insert into authors(first_name, last_name, email, phone, create_dt)
  values('Mabel', 'Hartford', 'mhartford@gmail.com', '246 756-4443', sysdate());

/*Select the captions table and using the SQL tab run the following queries */

  update web19101.captions set author_id = 1 where caption_id in(1, 2, 3, 4);
  update web19101.captions set author_id = 2 where caption_id in(5, 6, 7, 8);
  update web19101.captions set author_id = 3 where caption_id in(9, 10, 11, 12);
  update web19101.captions set author_id = 4 where caption_id in(13, 14);
