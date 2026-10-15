// 상어집사 API 서버 — 지금은 연결 확인용 뼈대. 게임 API는 이어서 추가한다.
const ALLOWED_ORIGINS = ['https://shark-keeper.github.io'];

function cors(req) {
  const origin = req.headers.get('Origin');
  return {
    'Access-Control-Allow-Origin': ALLOWED_ORIGINS.includes(origin) ? origin : ALLOWED_ORIGINS[0],
    'Access-Control-Allow-Methods': 'GET, POST, OPTIONS',
    'Access-Control-Allow-Headers': 'Content-Type, Authorization',
    'Vary': 'Origin',
  };
}

const json = (req, data, status = 200) =>
  new Response(JSON.stringify(data), { status, headers: { 'Content-Type': 'application/json; charset=utf-8', ...cors(req) } });

export default {
  async fetch(req, env) {
    if (req.method === 'OPTIONS') return new Response(null, { status: 204, headers: cors(req) });
    const { pathname } = new URL(req.url);
    if (pathname === '/' || pathname === '/health') {
      let db = false;
      try { db = (await env.DB.prepare('SELECT 1 AS ok').first('ok')) === 1; } catch (e) { db = false; }
      return json(req, { ok: true, service: 'shark-keeper-api', db, time: Date.now() });
    }
    return json(req, { ok: false, error: 'not_found' }, 404);
  },
};
