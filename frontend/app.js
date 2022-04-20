import containers from './containers.json'
console.log(containers)

if ('content' in document.createElement('template')) {
  const template = document.querySelector('#container')

  containers.forEach((container, i) => {
    const ul = document.querySelector('ul')
    const clone = document.importNode(template.content, true)
    const a = clone.querySelector('a')
    a.href = container
    const span = clone.querySelector('span')
    span.textContent = i + 1

    ul.appendChild(clone)
  })
}
