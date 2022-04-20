const containers = await fetch('./containers.json').then((response) =>
  response.json(),
)

if ('content' in document.createElement('template')) {
  const template = document.querySelector('#container')

  containers.forEach((container, i) => {
    const ul = document.querySelector('ul')
    const clone = document.importNode(template.content, true)
    const a = clone.querySelector('a')
    a.href = container
    const span = clone.querySelectorAll('span')
    span[0].textContent = i + 1
    span[1].textContent = container

    ul.appendChild(clone)
  })
}
