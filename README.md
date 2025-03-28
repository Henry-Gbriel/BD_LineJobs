#  Sistema de Gestão de Vagas de Emprego

Este projeto é um banco de dados estruturado para um sistema de gestão de vagas de emprego, permitindo o cadastro de usuários, empresas, candidatos, vagas, candidaturas, favoritos, mensagens e recuperação de senha.

<h2>📋 Estrutura do Banco de Dados</h2>
<ul>
    <li><strong>usuario</strong>: Armazena informações gerais dos usuários, podendo ser candidatos ou empresas.</li>
    <li><strong>empresa</strong>: Contém dados específicos das empresas.</li>
    <li><strong>candidato</strong>: Contém informações sobre candidatos, incluindo habilidades e experiência.</li>
    <li><strong>vaga</strong>: Representa as oportunidades de emprego disponíveis.</li>
    <li><strong>candidatura</strong>: Relaciona candidatos às vagas em que se inscreveram.</li>
    <li><strong>favorito</strong>: Permite que candidatos salvem vagas de interesse.</li>
    <li><strong>mensagem</strong>: Implementa um sistema de mensagens entre usuários.</li>
    <li><strong>recuperacao_senha</strong>: Gerencia solicitações de redefinição de senha.</li>
</ul>

<h2>🏗️ Modelo Lógico e Conceitual</h2>
<p>O modelo lógico e conceitual do banco de dados representam a estrutura e os relacionamentos entre as tabelas. Adicione as imagens ou diagramas para facilitar a compreensão:</p>
<img src="https://github.com/user-attachments/assets/f230e29a-2095-4ea8-93e0-6b1bda0d0cb0" alt="Modelo Conceitual">
<br>
<br>
<img src="https://github.com/user-attachments/assets/40b98e36-d165-4f50-b851-adbd615910d7" alt="Modelo Lógico">

<h2>🔍 Características dos Elementos das Tabelas</h2>
<ul>
    <li><strong>Chave Primária (PRIMARY KEY)</strong>: Identificador único de cada registro na tabela.</li>
    <li><strong>Chave Estrangeira (FOREIGN KEY)</strong>: Define relações entre tabelas para manter integridade referencial.</li>
    <li><strong>Tipos de Dados</strong>:
        <ul>
            <li><code>VARCHAR</code> - Usado para armazenar textos curtos.</li>
            <li><code>TEXT</code> - Para textos mais longos.</li>
            <li><code>BIGINT</code> - Para identificadores numéricos de grande escala.</li>
            <li><code>DECIMAL</code> - Para valores monetários.</li>
            <li><code>ENUM</code> - Para valores pré-definidos como status e tipos.</li>
            <li><code>TIMESTAMP</code> - Para armazenar datas e horários.</li>
        </ul>
    </li>
</ul>

<h2>🚀 Tecnologias Utilizadas</h2>
<ul>
    <li><strong>MySQL</strong> - Banco de dados relacional</li>
    <li><strong>SQL</strong> - Linguagem para manipulação de banco de dados</li>
</ul>

<h2>📄 Licença</h2>
<p>Este projeto está licenciado sob a <a href="LICENSE">MIT License</a>.</p>
    
<h2>🤝 Contribuição</h2>
<p>Fique à vontade para abrir issues e enviar pull requests para melhorias no projeto!</p>
    
<h2>📞 Contato</h2>
<p>Caso tenha dúvidas ou sugestões, entre em contato:</p>
<ul>
    <li>📧 Email: <a href="mailto:santossilvahenrygabriel58@gmail.com">Meu email de contato</a></li>
    <li>🔗 LinkedIn: <a href="www.linkedin.com/in/henry-gabriel-santos-silva-6ba776209">Meu Perfil linkedin</a></li>
</ul>
    
<hr>
    
<p>⭐ Se gostou do projeto, deixe um star no repositório!</p>



 
