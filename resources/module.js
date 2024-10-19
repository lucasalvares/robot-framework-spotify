async function MockMySong(page) {

    const testData =
    {
        "id": 3,
        "title": "Mockado com sucesso >:D",
        "artist": "The Doors",
        "description": "The Doors mockado com sucesso",
        "image": "https://raw.githubusercontent.com/qaxperience/mock/main/covers/elvis.jpg",
        "type": "album",
        "src": "https://raw.githubusercontent.com/qaxperience/mock/main/songs/nirvana.mp3"
    }

    await page.route('**/songs', route => route.fulfill({
        status: 200,
        body: JSON.stringify([testData])
    }))
}
exports.__esModule = true;
exports.MockMySong = MockMySong;