import containers from './containers.json'
console.log(containers)

// const template = document.createElement('template')

// template.innerHTML = `<li v-for="(container, i) in containers" :key="i"><a :href="container" class="machine"><img src="../assets/images/pc.png" alt="PC icon" />poste ${i}</a></li>`

// On vérifie si le navigateur prend en charge
// l'élément HTML template en vérifiant la présence
// de l'attribut content pour l'élément template.
if ('content' in document.createElement('template')) {
  // On prépare une ligne pour le tableau
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
