export class Professor {
  constructor({ id, name, aspects = [] }) {
    this.id = id;
    this.name = name;
    this.aspects = aspects;
  }
}

export class ProfessorAspect {
  constructor({ aspect, detail }) {
    this.aspect = aspect;
    this.detail = detail;
  }
}
