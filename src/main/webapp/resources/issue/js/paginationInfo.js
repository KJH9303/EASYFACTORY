const postsPerPage = 10;
const dummyPosts = [
    { title: "Post 1", author: "Author 1", date: "2023-01-01" },
    { title: "Post 2", author: "Author 2", date: "2023-02-02" },
    { title: "Post 3", author: "Author 3", date: "2023-03-03" },
    { title: "Post 3", author: "Author 3", date: "2023-03-03" },
    // ... 여기에 더 많은 게시물을 추가 가능
];

function generatePagination() {
    const numberOfPages = Math.ceil(dummyPosts.length / postsPerPage);
    let paginationHTML = "";

    for (let i = 1; i <= numberOfPages; i++) {
        paginationHTML += `<button onclick="changePage(${i})">${i}</button>`;
    }

    document.getElementById("pagination").innerHTML = paginationHTML;
}

// ...

function changePage(page) {
    const startIndex = (page - 1) * postsPerPage;
    const endIndex = Math.min(startIndex + postsPerPage, dummyPosts.length);
    
    let postsHTML = "";

    for (let i = startIndex; i < endIndex; i++) {
        const post = dummyPosts[i];
        postsHTML +=
        `<tr>
            <td>${i + 1}</td> <!-- 글 번호 추가 -->
            <td><a href="post.html">${post.title}</a></td>
            <td>${post.author}</td>
            <td>${post.date}</td>
        </tr>`;
    }

    document.getElementById("posts").innerHTML = postsHTML; // 변경된 부분
}

// ...


function init() {
    generatePagination();
    changePage(1);
}

init();
