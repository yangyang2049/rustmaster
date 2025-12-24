const https = require('https');
const fs = require('fs');
const path = require('path');

const USER_AGENT = 'FlagWikiApp/1.0 (Educational Project)';
const REQUEST_TIMEOUT = 15000;

// 带超时的HTTP GET请求
function httpGetWithTimeout(url, options, timeout = REQUEST_TIMEOUT) {
  return new Promise((resolve, reject) => {
    const timer = setTimeout(() => {
      req.destroy();
      reject(new Error('Request timeout'));
    }, timeout);
    
    const req = https.get(url, options, (res) => {
      clearTimeout(timer);
      resolve(res);
    });
    
    req.on('error', (err) => {
      clearTimeout(timer);
      reject(err);
    });
  });
}

// 搜索Commons文件
async function searchCommons(searchQuery) {
  const apiUrl = `https://commons.wikimedia.org/w/api.php?action=query&list=search&srsearch=${encodeURIComponent(searchQuery)}&srnamespace=6&srlimit=20&format=json`;
  
  try {
    const res = await httpGetWithTimeout(apiUrl, {
      headers: { 'User-Agent': USER_AGENT }
    });
    
    let data = '';
    res.on('data', (chunk) => data += chunk);
    
    return new Promise((resolve, reject) => {
      res.on('end', () => {
        try {
          const json = JSON.parse(data);
          resolve(json.query?.search || []);
        } catch (e) {
          reject(e);
        }
      });
    });
  } catch (error) {
    return [];
  }
}

// 查找NO和BR的音频文件
async function findFiles() {
  console.log('搜索挪威 (NO) 的国歌文件...\n');
  const noSearches = [
    'Norway national anthem',
    'Ja vi elsker dette landet',
    'Norwegian national anthem',
    'anthem Norway'
  ];
  
  for (const query of noSearches) {
    console.log(`搜索: ${query}`);
    const results = await searchCommons(query);
    for (const result of results) {
      const title = result.title.replace('File:', '');
      const lower = title.toLowerCase();
      if ((lower.includes('.ogg') || lower.includes('.oga')) && 
          (lower.includes('norway') || lower.includes('norwegian') || lower.includes('ja vi'))) {
        console.log(`  找到: ${title}`);
        console.log(`  链接: https://commons.wikimedia.org/wiki/File:${encodeURIComponent(title)}\n`);
      }
    }
    await new Promise(r => setTimeout(r, 1000));
  }
  
  console.log('\n搜索巴西 (BR) 的国歌文件...\n');
  const brSearches = [
    'Brazil national anthem',
    'Hino Nacional Brasileiro',
    'Brazilian national anthem',
    'anthem Brazil'
  ];
  
  for (const query of brSearches) {
    console.log(`搜索: ${query}`);
    const results = await searchCommons(query);
    for (const result of results) {
      const title = result.title.replace('File:', '');
      const lower = title.toLowerCase();
      if ((lower.includes('.ogg') || lower.includes('.oga')) && 
          (lower.includes('brazil') || lower.includes('brasileiro') || lower.includes('hino'))) {
        console.log(`  找到: ${title}`);
        console.log(`  链接: https://commons.wikimedia.org/wiki/File:${encodeURIComponent(title)}\n`);
      }
    }
    await new Promise(r => setTimeout(r, 1000));
  }
}

findFiles().catch(console.error);


